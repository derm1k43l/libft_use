# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrusu <mrusu@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/07 19:00:18 by mrusu             #+#    #+#              #
#    Updated: 2024/03/01 18:07:30 by mrusu            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# COMPILER
CC = cc

# FLAGS FOR COMPILATION
FLAGS = -Wall -Wextra -Werror

# LIBRARY NAME
NAME = libft.a

# DIRECTORIES
SRC_DIR = srcs
INC_DIR = inc
OBJ_DIR = obj

# HEADER FILE
HEADER = $(INC_DIR)/libft.h

# LIST OF SOURCE FILES
SRCS = \
    $(SRC_DIR)/ft_atoi.c $(SRC_DIR)/ft_bzero.c $(SRC_DIR)/ft_calloc.c \
    $(SRC_DIR)/ft_isalnum.c $(SRC_DIR)/ft_isalpha.c $(SRC_DIR)/ft_isascii.c $(SRC_DIR)/ft_isdigit.c $(SRC_DIR)/ft_isprint.c \
    $(SRC_DIR)/ft_itoa.c \
    $(SRC_DIR)/ft_memchr.c $(SRC_DIR)/ft_memcmp.c $(SRC_DIR)/ft_memcpy.c $(SRC_DIR)/ft_memmove.c $(SRC_DIR)/ft_memset.c \
    $(SRC_DIR)/ft_putchar_fd.c $(SRC_DIR)/ft_putendl_fd.c $(SRC_DIR)/ft_putnbr_fd.c $(SRC_DIR)/ft_putstr_fd.c \
    $(SRC_DIR)/ft_split.c $(SRC_DIR)/ft_strchr.c $(SRC_DIR)/ft_strdup.c $(SRC_DIR)/ft_striteri.c $(SRC_DIR)/ft_strjoin.c \
    $(SRC_DIR)/ft_strlcat.c $(SRC_DIR)/ft_strlcpy.c $(SRC_DIR)/ft_strlen.c $(SRC_DIR)/ft_strmapi.c $(SRC_DIR)/ft_strncmp.c \
    $(SRC_DIR)/ft_strnstr.c $(SRC_DIR)/ft_strrchr.c $(SRC_DIR)/ft_strtrim.c $(SRC_DIR)/ft_substr.c $(SRC_DIR)/ft_tolower.c $(SRC_DIR)/ft_toupper.c \
    $(SRC_DIR)/ft_lstadd_back.c $(SRC_DIR)/ft_lstadd_front.c $(SRC_DIR)/ft_lstclear.c $(SRC_DIR)/ft_lstiter.c \
    $(SRC_DIR)/ft_lstnew.c $(SRC_DIR)/ft_lstsize.c $(SRC_DIR)/ft_lstdelone.c $(SRC_DIR)/ft_lstlast.c \
    $(SRC_DIR)/get_next_line.c \
    $(SRC_DIR)/ft_functions.c $(SRC_DIR)/ft_printf.c
OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

# COLORS
GREEN = \033[0;32m
NC = \033[0m

# ALL RULE
# RULES TO MAKE A LIBRARY
all: $(NAME)
	@echo "$(GREEN)libft build successful$(NC)"

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)

# RULES FOR CREATING OBJECT FILES
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(FLAGS) -I$(INC_DIR) -c $< -o $@

# RULES TO CLEAN EVERYTHING
clean:
	@rm -rf $(OBJ_DIR)
	@echo "$(GREEN)libft cleaned$(NC)"

fclean: clean
	@rm -f $(NAME)
	@echo "$(GREEN)libft fcleaned$(NC)"

# RULES FOR RECOMPILATION
re: fclean all

.PHONY: all clean fclean re