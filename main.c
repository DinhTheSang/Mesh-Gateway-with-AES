/* C Standard Library headers */
#include <stdlib.h>
#include <stdio.h>

/* Board headers */
#include "init_mcu.h"
#include "init_board.h"
#include "init_app.h"
#include "ble-configuration.h"
#include "board_features.h"
#include "retargetserial.h"

/* Bluetooth stack headers */
#include "bg_types.h"
#include "native_gecko.h"
#include "gatt_db.h"
#include <gecko_configuration.h>
#include "mesh_generic_model_capi_types.h"
#include "mesh_lib.h"
#include <mesh_sizes.h>

/* Libraries containing default Gecko configuration values */
#include "em_emu.h"
#include "em_cmu.h"
#include <em_crypto.h>
#include <em_gpio.h>
#include "mbedtls_config.h"
#include "aes_alt.h"

/* Device initialization header */
#include "hal-config.h"

#if defined(HAL_CONFIG)
#include "bsphalconfig.h"
#else
#include "bspconfig.h"
#endif

/* User command
 Include emlib and user library in here.
 */
#include "graphics.h"
#include "lcd_driver.h"
#include "log.h"

//Bluetooth stack heap
#define MAX_CONNECTIONS 2

uint8_t bluetooth_stack_heap[DEFAULT_BLUETOOTH_HEAP(MAX_CONNECTIONS)
		+ BTMESH_HEAP_SIZE + 1760];

// Bluetooth advertisement set configuration
//
// At minimum the following is required:
// * One advertisement set for Bluetooth LE stack (handle number 0)
// * One advertisement set for Mesh data (handle number 1)
// * One advertisement set for Mesh unprovisioned beacons (handle number 2)
// * One advertisement set for Mesh unprovisioned URI (handle number 3)
// * N advertisement sets for Mesh GATT service advertisements
// (one for each network key, handle numbers 4 .. N+3)
//
#define MAX_ADVERTISERS (4 + MESH_CFG_MAX_NETKEYS)

static gecko_bluetooth_ll_priorities linklayer_priorities =
		GECKO_BLUETOOTH_PRIORITIES_DEFAULT;

// bluetooth stack configuration
extern const struct bg_gattdb_def bg_gattdb_data;

// Flag for indicating DFU Reset must be performed
uint8_t boot_to_dfu = 0;

const gecko_configuration_t config = { .bluetooth.max_connections =
		MAX_CONNECTIONS, .bluetooth.max_advertisers = MAX_ADVERTISERS,
		.bluetooth.heap = bluetooth_stack_heap, .bluetooth.heap_size =
				sizeof(bluetooth_stack_heap) - BTMESH_HEAP_SIZE,
		.bluetooth.sleep_clock_accuracy = 100, .bluetooth.linklayer_priorities =
				&linklayer_priorities, .gattdb = &bg_gattdb_data,
		.btmesh_heap_size = BTMESH_HEAP_SIZE,
#if (HAL_PA_ENABLE)
		.pa.config_enable = 1, // Set this to be a valid PA config
#if defined(FEATURE_PA_INPUT_FROM_VBAT)
		.pa.input = GECKO_RADIO_PA_INPUT_VBAT, // Configure PA input to VBAT
#else
		.pa.input = GECKO_RADIO_PA_INPUT_DCDC,
#endif // defined(FEATURE_PA_INPUT_FROM_VBAT)
#endif // (HAL_PA_ENABLE)
		.max_timers = 16, };

/* User commnad
 * Define header for LCD Graphic
 */
#define APP_KEY_INDEX       0

#define MY_APP_HEADER 		   "\nFIRMESH TEAM\nBLE MESH THESIS\n******************\n"
#define MY_APP_HEADER_SIZE 	 (sizeof(MY_APP_HEADER))

#define ENCRYPT_MODE 1
#define DECRYPT_MODE 0

//Packet sent by BLE must be 16 byte !!!
#define DATA_LENGTH 16
#define KEY_LENGTH  16

//Define advertising parameters
#define ADVERTISING_HANDLE 0
#define ADVERTISING_PACKET 0

#define INTERVAL_MIN 160
#define INTERVAL_MAX 160
#define ADVERTISING_DURATION 0
#define ADVERTISING_MAX_EVENT 0

//Define clock frequency
#define TIMER_CLOCK_FREQ             (uint32) 32768
#define TIMER_MILLIS_SECONDS(ms)     ((TIMER_CLOCK_FREQ * ms)/1000)

//Timer handlers define
#define TIMER_ID_RESTART          78
#define TIMER_ID_FACTORY_RESET    77
#define TIMER_ID_CHANGE_DATA      20
#define TIMER_ID_BLINK_LED        10

//Time define
#define TIME_CHANGE_DATA      (uint32)(30 * TIMER_CLOCK_FREQ)

//Variable for test change data when in advertising mode
uint8 sample_data = 0;
uint16 primary_element = 0;
//Variable for AES Test
mbedtls_aes_context aes_context;
unsigned int key_bits = 128UL;
unsigned char encrypted_buffer[DATA_LENGTH];
unsigned char decrypted_buffer[DATA_LENGTH];
const unsigned char aes_default_key[KEY_LENGTH] = { 0xff, 0x00, 0xff, 0x00,
		0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00 };
unsigned char input_buffer[DATA_LENGTH] = { 'x', 'i', 'n', 'c', 'h', 'a', 'o',
		'm', 'o', 'i', 'n', 'g', 'u', 'o', 'i', 'e' };

//User function
static void button_init();
static void led_init();
static void stack_init();
static void lcd_init();
void set_device_name(bd_addr *pAddr);
void factory_reset();
void test_hardware_aes();
void test_encrypt_data();
void send_advertising_data();
bool mesh_bgapi_listener(struct gecko_cmd_packet *evt);
static void handle_gecko_event(uint32_t evt_id, struct gecko_cmd_packet *evt);
static void pri_level_request(uint16_t model_id, uint16_t element_index,
		uint16_t client_addr, uint16_t server_addr, uint16_t appkey_index,
		const struct mesh_generic_request *request, uint32_t transition_ms,
		uint16_t delay_ms, uint8_t request_flags);

static void pri_level_change(uint16_t model_id, uint16_t element_index,
		const struct mesh_generic_state *current,
		const struct mesh_generic_state *target, uint32_t remaining_ms);
int main() {
	// Initialize device
	initMcu();
	// Initialize board
	initBoard();
	// Initialize application
	initApp();

	stack_init();

	//Init LOG, use to debug in Serial Port
	//Turn On VCOM before call this function
	INIT_LOG();

	//Init button and led
	button_init();
	led_init();

	//Init LCD
	lcd_init();

	//Init data
	memset(encrypted_buffer, 0, DATA_LENGTH);
	memset(decrypted_buffer, 0, DATA_LENGTH);

	//Print to console
	LOGI("*\r\n*\r\n*\r\n*\r\n*\r\n");
	LOGI("Welcome to FIRMESH TEAM\r\n");
	LOGI("This application will provision a device to Mesh network\r\n");
	LOGI("------------------------------------------------------------\r\n");

	while (1) {
		struct gecko_cmd_packet *evt = gecko_wait_event();
		bool pass = mesh_bgapi_listener(evt);
		if (pass) {
			handle_gecko_event(BGLIB_MSG_ID(evt->header), evt);
		}
	}
}

static void button_init() {
	GPIO_PinModeSet(BSP_BUTTON0_PORT, BSP_BUTTON0_PIN, gpioModeInputPull, 1);
	GPIO_PinModeSet(BSP_BUTTON1_PORT, BSP_BUTTON1_PIN, gpioModeInputPull, 1);
}

static void led_init() {
	GPIO_PinModeSet(BSP_LED0_PORT, BSP_LED0_PIN, gpioModePushPull, 0);
	GPIO_PinModeSet(BSP_LED1_PORT, BSP_LED1_PIN, gpioModePushPull, 0);
}

static void stack_init() {
	// Minimize advertisement latency by allowing the advertiser to always
	// interrupt the scanner.
	linklayer_priorities.scan_max = linklayer_priorities.adv_min + 1;

	gecko_stack_init(&config);
	gecko_bgapi_class_dfu_init();
	gecko_bgapi_class_system_init();
	gecko_bgapi_class_le_gap_init();
	gecko_bgapi_class_le_connection_init();
	//gecko_bgapi_class_gatt_init();
	gecko_bgapi_class_gatt_server_init();
	gecko_bgapi_class_hardware_init();
	gecko_bgapi_class_flash_init();
	gecko_bgapi_class_test_init();
	//gecko_bgapi_class_sm_init();
	//mesh_native_bgapi_init();

	gecko_bgapi_class_mesh_node_init();
	//gecko_bgapi_class_mesh_prov_init();
	gecko_bgapi_class_mesh_proxy_init();
	gecko_bgapi_class_mesh_proxy_server_init();
	//gecko_bgapi_class_mesh_proxy_client_init();
	//gecko_bgapi_class_mesh_generic_client_init();
	gecko_bgapi_class_mesh_generic_server_init();
	//gecko_bgapi_class_mesh_vendor_model_init();
	//gecko_bgapi_class_mesh_health_client_init();
	//gecko_bgapi_class_mesh_health_server_init();
	//gecko_bgapi_class_mesh_test_init();
	//gecko_bgapi_class_mesh_lpn_init();
	gecko_bgapi_class_mesh_friend_init();

	gecko_initCoexHAL();
}

static void lcd_init() {
	//Init LCD graphics header
	char header_buffer[MY_APP_HEADER_SIZE + 1];
	snprintf(header_buffer, MY_APP_HEADER_SIZE, MY_APP_HEADER);
	LCD_init(header_buffer);
}

void set_device_name(bd_addr *pAddr) {
	char name[20];
	sprintf(name, "Address: %02x:%02x", pAddr->addr[1], pAddr->addr[0]);

	LOGV("Bluetooth Mesh Device Address: %02x:%02x:%02x:%02x:%02x:%02x\r\n",
			pAddr->addr[5], pAddr->addr[4], pAddr->addr[3], pAddr->addr[2],
			pAddr->addr[1], pAddr->addr[0]);

	LCD_write(name, LCD_ROW_NAME);
}

void factory_reset() {
	LCD_write("*******", LCD_ROW_INFO);
	LCD_write("FACTORY RESET", LCD_ROW_INFO + 1);
	LCD_write("*******", LCD_ROW_INFO + 2);

	LOGW("***********************************************\r\n");
	LOGW("*************FACTORY RESET*********************\r\n");
	LOGW("***********************************************\r\n");

	gecko_cmd_flash_ps_erase_all();
	gecko_cmd_hardware_set_soft_timer(2 * 32768, TIMER_ID_FACTORY_RESET, 1);
}

void test_hardware_aes() {
	int i;
	int result;

	//Init context for AES
	mbedtls_aes_init(&aes_context);

	LOGD("-----------------------------------------------\r\n");
	LOGD("***********************************************\r\n");
	LOGI("Test AES !!! \r\n");
	LOGV("Encryption and Decryption by Hardware with embedTLS library \r\n");

	LOGD("********************\r\n");
	LOGI("Data to encrypt:  %.*s \r\n", DATA_LENGTH, input_buffer);
	LOGI("Data to encrypt: \r\n");
	for (i = 0; i < DATA_LENGTH; i++) {
		LOGI("%x  ", input_buffer[i]);
	}
	LOGI("\r\n");

	LOGD("********************\r\n");
	LOGV("Start Encryption process !!! \r\n");
	result = mbedtls_aes_setkey_enc(&aes_context, aes_default_key, key_bits);
	if (result == 0) {
		LOGD("Set encrypt key successfully !!! \r\n");
	} else {
		LOGE("Invalid encrypt key !!! \r\n");
	}

	result = mbedtls_aes_crypt_ecb(&aes_context, ENCRYPT_MODE, input_buffer,
			encrypted_buffer);
	if (result == 0) {
		LOGD("Encryption process successfully !!! \r\n");
		LOGI("Encrypted data:  %.*s \r\n", DATA_LENGTH, encrypted_buffer);
		LOGI("Encrypted data: \r\n");
		int i = 0;
		for (; i < DATA_LENGTH; i++) {
			LOGI("%x  ", encrypted_buffer[i]);
		}
		LOGI("\r\n");
	} else {
		LOGE("Encryption process failed !!! \r\n");
	}

	LOGD("********************\r\n");
	LOGI("Start Decryption process !!! \r\n");
	result = mbedtls_aes_setkey_dec(&aes_context, aes_default_key, key_bits);
	if (result == 0) {
		LOGD("Set decrypt key successfully !!! \r\n");
	} else {
		LOGE("Invalid decrypt key !!! \r\n");
	}

	result = mbedtls_aes_crypt_ecb(&aes_context, DECRYPT_MODE, encrypted_buffer,
			decrypted_buffer);
	if (result == 0) {
		LOGD("Decryption process successfully !!! \r\n");
		LOGI("Decrypted data:  %.*s \r\n", DATA_LENGTH, decrypted_buffer);
		LOGI("Decrypted data: \r\n");
		int i = 0;
		for (; i < DATA_LENGTH; i++) {
			LOGI("%x  ", decrypted_buffer[i]);
		}
		LOGI("\r\n");
	} else {
		LOGE("Decryption process failed !!! \r\n");
	}
}
void uint16ToString(uint16 num , char* result){
	uint8 i = 15;
	for(i; i > -1; i--){
		result[i] = num/2;
		num /= 2;
	}
}
void encrypt_data(uint16 message) {
	int result;
	uint16ToString(message, input_buffer);
	//memset(input_buffer, sample_data, DATA_LENGTH);
	//Data will be sent with a series of integer in range [1...5]
	result = mbedtls_aes_setkey_enc(&aes_context, aes_default_key, key_bits);
	if (result != 0) {
		LOGE("Invalid encrypt key !!! \r\n");
	}
	result = mbedtls_aes_crypt_ecb(&aes_context, ENCRYPT_MODE, input_buffer,
			encrypted_buffer);
	if (result == 0) {
		LOGD("Encryption process successfully !!! \r\n");
		LOGI("Encrypted data:  %.*s \r\n", DATA_LENGTH, encrypted_buffer);
		LOGI("Encrypted data: \r\n");
		int i = 0;
		for (; i < DATA_LENGTH; i++) {
			LOGI("%x  ", encrypted_buffer[i]);
		}
		LOGI("\r\n");
	} else {
		LOGE("Encryption process failed !!! \r\n");
	}
}

void send_advertising_data() {
	/* Set 0 dBm Transmit Power */
	gecko_cmd_system_set_tx_power(0);

	/* Set custom advertising data */
	gecko_cmd_le_gap_bt5_set_adv_data(ADVERTISING_HANDLE,
	ADVERTISING_PACKET,
	DATA_LENGTH, encrypted_buffer);

	/* Set advertising parameters. 100ms advertisement interval.
	 * The first two parameters are minimum and maximum advertising interval,
	 * both in units of (milliseconds * 1.6). */
	gecko_cmd_le_gap_set_advertise_timing(ADVERTISING_HANDLE,
	INTERVAL_MIN,
	INTERVAL_MAX,
	ADVERTISING_DURATION,
	ADVERTISING_MAX_EVENT);

	/* Start advertising in user mode and enable connections */
	gecko_cmd_le_gap_start_advertising(ADVERTISING_HANDLE, le_gap_user_data,
			le_gap_non_connectable);
}

static void pri_level_request(uint16_t model_id, uint16_t element_index,
		uint16_t client_addr, uint16_t server_addr, uint16_t appkey_index,
		const struct mesh_generic_request *request, uint32_t transition_ms,
		uint16_t delay_ms, uint8_t request_flags) {
	if (request->kind != mesh_generic_request_level) {
		return;
	}
	encrypt_data(request->level);
	send_advertising_data();
}

static void pri_level_change(uint16_t model_id, uint16_t element_index,
 const struct mesh_generic_state *current,
 const struct mesh_generic_state *target, uint32_t remaining_ms) {
 }
void gateway_node_init() {
	uint16 result;

	mesh_lib_init(malloc, free, 8);

	mesh_lib_generic_server_register_handler(MESH_GENERIC_LEVEL_SERVER_MODEL_ID,
			primary_element, pri_level_request, pri_level_change);
}
static void handle_gecko_event(uint32_t evt_id, struct gecko_cmd_packet *evt) {
	uint16 result;
	char buf[30];

	if (evt == NULL) {
		return;
	}

	switch (evt_id) {
	case gecko_evt_system_boot_id:
		if (GPIO_PinInGet(BSP_BUTTON0_PORT, BSP_BUTTON0_PIN) == 0
				|| GPIO_PinInGet(BSP_BUTTON1_PORT, BSP_BUTTON1_PIN) == 0) {
			factory_reset();
		} else {
			struct gecko_msg_system_get_bt_address_rsp_t *pAddr =
					gecko_cmd_system_get_bt_address();

			set_device_name(&pAddr->address);

			result = gecko_cmd_mesh_node_init()->result;
			if (result) {
				sprintf(buf, "Init Failed");

				LOGE("Bluetooth Mesh Stack Init Failed !!!!!!\r\n");
				LOGE("Error code: %x \r\n", result);

				LCD_write(buf, LCD_ROW_ERR);
			}
		}
		break;

	case gecko_evt_hardware_soft_timer_id:
		switch (evt->data.evt_hardware_soft_timer.handle) {
		case TIMER_ID_FACTORY_RESET:
			gecko_cmd_system_reset(0);
			break;

		case TIMER_ID_RESTART:
			gecko_cmd_system_reset(0);
			break;

		case TIMER_ID_BLINK_LED:
			GPIO_PinOutToggle(BSP_LED0_PORT, BSP_LED0_PIN);
			GPIO_PinOutToggle(BSP_LED1_PORT, BSP_LED1_PIN);
			break;

		/*case TIMER_ID_CHANGE_DATA:
			encrypt_data();

			//Stop advertising data and send new data after changed
			gecko_cmd_le_gap_stop_advertising(ADVERTISING_HANDLE);
			send_advertising_data();
			break;
		 */
		default:
			break;
		}
		break;
		case gecko_evt_mesh_generic_server_client_request_id:

			break;
	case gecko_evt_mesh_node_initialized_id:
		LOGD("Node initialized !!! \r\n");
		//gecko_cmd_mesh_generic_server_init();
		result = gecko_cmd_mesh_generic_server_init()->result;
		if (result) {
			printf("gateway Init failed !!! \r\n");
		}
		//Test AES Encrypted and Send encrypted data with advertising mode
		test_hardware_aes();
		send_advertising_data();

		//Change data sent after every 60s
//		gecko_cmd_hardware_set_soft_timer(TIME_CHANGE_DATA,
//				TIMER_ID_CHANGE_DATA, 0);

		if (!evt->data.evt_mesh_node_initialized.provisioned) {
			LCD_write("Unprovisioned !!!", LCD_ROW_INFO);
			LOGI("Device Unprovisioned !!!!!!\r\n");

			// The Node is now initialized, start unprovisioned Beaconing using PB-ADV and PB-GATT Bearers
			//gecko_cmd_mesh_node_start_unprov_beaconing(0x3);
		} else {
			LCD_write("Provisioned !!!", LCD_ROW_INFO);
			LOGI("Device Provisioned !!!!!!\r\n");
			gateway_node_init();
		}
		break;

	case gecko_evt_mesh_node_provisioning_started_id:
		LCD_write("Provisioning...", LCD_ROW_INFO);
		LOGI("Provisioning Process !!!!!!\r\n");

		gecko_cmd_hardware_set_soft_timer(TIMER_MILLIS_SECONDS(1000),
				TIMER_ID_BLINK_LED, 0);
		break;

	case gecko_evt_mesh_node_provisioned_id:
		LCD_write("Provisioned !!!", LCD_ROW_INFO);
		LOGI("Device Provisioned !!!!!!\r\n");

		gecko_cmd_hardware_set_soft_timer(0, TIMER_ID_BLINK_LED, 1);
		GPIO_PinOutClear(BSP_LED0_PORT, BSP_LED0_PIN);
		GPIO_PinOutClear(BSP_LED1_PORT, BSP_LED1_PIN);
		break;

	default:
		break;
	}
}
