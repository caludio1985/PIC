############################################
#		Variables
############################################
#Microcontrolador
MCU = 16F887
#JTAG
JTAG = pk2cmd
#Conexion
IP = raspberrypi.local
#Fuentes
MAIN = main
FUNC = gpio
#Compilacion
XC8 = xc8-cc
###########################################

all:
	$(XC8) -mcpu=$(MCU) $(MAIN).c $(FUNC).c

upload:
	scp $(MAIN).hex pi@$(IP):/home/pi
	ssh pi@$(IP) "$(JTAG) -P PIC$(MCU) -M -F $(MAIN).hex"

clean:
	rm -rf *.d *.p1 *.cmf *.elf *.hex *.hxl *.s* startup.* *.o
	ssh pi@$(IP) "rm -rf $(MAIN).hex"
