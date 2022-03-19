.SUFFIXES : .c .o
PRJ_ROOT_PATH=$(shell pwd)
PRJ_SRC_PATH=$(PRJ_ROOT_PATH)/src

CC=arm-linux-gnueabihf-gcc

INC=-I$(PRJ_ROOT_PATH)/inc
LIBS=-lpthread
CFLAGS=-g -Wall $(INC)

OBJS=ioctl_main.o $(PRJ_SRC_PATH)/ioctl.o $(PRJ_SRC_PATH)/poll.o $(PRJ_SRC_PATH)/function.o
SRCS=$(OBJS:.o=.c)

TARGET=ioctl_main

all : $(TARGET)

$(TARGET) : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS)

dep: 
	$(CC) -M $(INC) $(SRCS) > .depend

clean:
	clear
	rm  -rf $(OBJS) $(TARGET) core