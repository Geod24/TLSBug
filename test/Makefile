NAME	= bnet
CXXFLAGS += -g -std=c++11

SRCS	= main.cpp \
	unittest.cpp
OBJS=$(SRCS:.cpp=.o)

$(NAME): $(OBJS)
	$(CXX) $(CFLAGS) $(OBJS) -o $(NAME) -lpam -lreadline

all:    $(NAME)

clean:
	rm -rf $(OBJS)

fclean: clean
	rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re
.NOTPARALLEL: re
