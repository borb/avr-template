AVR := atmega2560
AVR_F_CPU := 16000000L
AVR_UART_BAUD := 115200

CC := avr-gcc
OBJCOPY := avr-objcopy
CFLAGS := -mmcu=$(AVR) -DF_CPU=$(AVR_F_CPU) -DBAUD=$(AVR_UART_BAUD) -O2

default: all

SRC := $(foreach x, ./, $(wildcard $(addprefix $(x)/*,.c*)))
OBJ := $(addprefix ./, $(addsuffix .o, $(notdir $(basename $(SRC)))))

all: avrpoop avrpoop.hex

avrpoop: $(SRC)

avrpoop.hex: avrpoop
	$(OBJCOPY) -O ihex $< $@

clean:
	rm -fv $(OBJ) avrpoop avrpoop.hex
