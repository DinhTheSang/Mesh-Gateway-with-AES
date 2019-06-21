#ifndef LOG_H
#define LOG_H

#define TEXT_BRIGHT_RED      "[1;31m"
#define TEXT_BRIGHT_GREEN    "[1;32m"
#define TEXT_BRIGHT_YELLOW   "[1;33m"
#define TEXT_BRIGHT_CYAN     "[1;36m"
#define TEXT_BRIGHT_WHITE    "[0m"

#include "stdio.h"
#include "retargetserial.h"

#define LOG(...) printf(__VA_ARGS__)
#define INIT_LOG() RETARGET_SerialInit()

#define LOGE(_prefix_, ...)  LOG(TEXT_BRIGHT_RED _prefix_, ##__VA_ARGS__)
#define LOGW(_prefix_, ...)  LOG(TEXT_BRIGHT_YELLOW _prefix_, ##__VA_ARGS__)
#define LOGI(_prefix_, ...)  LOG(TEXT_BRIGHT_CYAN _prefix_, ##__VA_ARGS__)
#define LOGD(_prefix_, ...)  LOG(TEXT_BRIGHT_GREEN _prefix_, ##__VA_ARGS__)
#define LOGV(_prefix_, ...)  LOG(TEXT_BRIGHT_WHITE _prefix_, ##__VA_ARGS__)

#endif
