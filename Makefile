##
## Makefile for logtop
##
## Made by julien palard
## Login   <logtop@mandark.fr>
##

NAME = logtop
DSRC = src
SRC = $(DSRC)/logtop.c $(DSRC)/avl.c $(DSRC)/history.c $(DSRC)/curses.c \
      $(DSRC)/stdout.c $(DSRC)/libavl/avl.c
OBJ = $(SRC:.c=.o)
CC = gcc
INCLUDE = .
DEFINE = _GNU_SOURCE
LIB = -lncurses #-lefence
CFLAGS = -O3 -W -Wall -ansi -pedantic -Wstrict-prototypes -I$(INCLUDE)
RM = rm -f
LDFLAGS =

$(NAME):	$(OBJ)
		$(CC) $(CFLAGS) -o $(NAME) $(OBJ) $(LIB) $(LDFLAGS)

install:	$(NAME)
		mkdir -p $(DESTDIR)/usr/bin/
		cp $(NAME) $(DESTDIR)/usr/bin/

all:
		@make $(NAME)

.c.o:
		$(CC) -D $(DEFINE) -c $(CFLAGS) $< -o $(<:.c=.o)

clean:
		$(RM) $(NAME) $(DSRC)/*~ $(DSRC)/#*# $(DSRC)/*.o $(DSRC)/*.core \
				$(DSRC)/libavl/*.o

re:		clean all
