#pragma once

typedef enum LogLevel {
    LOG_LEVEL_FATAL = 1,
    LOG_LEVEL_ERROR,
    LOG_LEVEL_WARNING,
    LOG_LEVEL_INFO,
    LOG_LEVEL_DEBUG,
    LOG_LEVEL_TRACE,
} LogLevel_t;

typedef enum LogMode {
    LOG_MODE_UNENCRYPTED = 0x00,
    LOG_MODE_AUTHENTICATED = 0x01,
    LOG_MODE_ENCRYPTED = 0x03,
} LogMode_t;