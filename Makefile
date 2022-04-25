# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lde-moul <lde-moul@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/09 18:36:11 by lde-moul          #+#    #+#              #
#    Updated: 2021/03/04 14:57:16 by lde-moul         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME = nibbler

CXX = clang++
CXXFLAGS = -Wall -Wextra -Werror

SRCDIR = src
OBJDIR = obj

SRC = Main.cpp\

OBJ := $(SRC:%.cpp=$(OBJDIR)/%.o)
SRC := $(SRC:%=$(SRCDIR)/%)
DEP := $(OBJ:%.o=%.d)


all: $(NAME)

clean:
	@/bin/rm -f $(OBJ) $(DEP)

fclean: clean
	@/bin/rm -f $(NAME)

re: fclean all

$(NAME): $(OBJDIR) $(OBJ)
	@$(CXX) $(CXXFLAGS) -o $@ $(OBJ)

-include $(DEP)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	@$(CXX) -std=c++11 -MMD -c -o $@ $(CXXFLAGS) $<

$(OBJDIR):
	@/bin/mkdir $(OBJDIR)

.PHONY: all clean fclean re
