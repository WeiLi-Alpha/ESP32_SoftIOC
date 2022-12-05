#!../../bin/linux-x86_64/ESP32_GPIO

## You may have to change ESP32_GPIO to something else
## everywhere it appears in this file

< envPaths
##epicsEnvSet("STREAM_PROTOCOL_PATH","${TOP}/protocols")
echo ${TOP}
epicsEnvSet("STREAM_PROTOCOL_PATH","/home/epics/baseAppl_devel/ESP32_GPIO/protocols")
cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/ESP32_GPIO.dbd"
ESP32_GPIO_registerRecordDeviceDriver(pdbbase)

## Load record instances
#dbLoadRecords("db/xxx.db","user=epicsdev")
dbLoadTemplate("db/ESP32_GPIO.substitutions")

drvAsynSerialPortConfigure("ESP32_1","/dev/ttyUSB0")
asynSetOption("ESP32_1",0,"baud","115200")
asynSetOption("ESP32_1",0,"bits","8")
asynSetOption("ESP32_1",0,"parity","none")
asynSetOption("ESP32_1",0,"stop","1")
asynSetOption("ESP32_1",0,"clocal","Y")
asynSetOption("ESP32_1",0,"crtscts","N")

cd "${TOP}/iocBoot/${IOC}"
iocInit()

## Start any sequence programs
#seq sncxxx,"user=epicsdev"
