TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = ESP32_GPIO
# ESP32_GPIO.dbd will be created and installed
DBD += ESP32_GPIO.dbd

# ESP32_GPIO.dbd will be made up from these files:
ESP32_GPIO_DBD += base.dbd

# Include dbd files from all support applications:
#ESP32_GPIO_DBD += xxx.dbd
ESP32_GPIO_DBD += calc.dbd
ESP32_GPIO_DBD += asyn.dbd
ESP32_GPIO_DBD += stream.dbd
ESP32_GPIO_DBD += drvAsynSerialPort.dbd

# Add all the support libraries needed by this IOC
#ESP32_GPIO_LIBS += xxx
ESP32_GPIO_LIBS += calc
ESP32_GPIO_LIBS += asyn
ESP32_GPIO_LIBS += stream

# ESP32_GPIO_registerRecordDeviceDriver.cpp derives from ESP32_GPIO.dbd
ESP32_GPIO_SRCS += ESP32_GPIO_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
ESP32_GPIO_SRCS_DEFAULT += ESP32_GPIOMain.cpp
ESP32_GPIO_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ESP32_GPIO_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
ESP32_GPIO_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

