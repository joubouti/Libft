# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ojoubout <ojoubout@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/09 22:19:28 by ojoubout          #+#    #+#              #
#    Updated: 2019/10/21 16:25:16 by ojoubout         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC=ft_memset.c ft_bzero.c ft_memcpy.c ft_memccpy.c ft_memmove.c ft_memchr.c \
	ft_memcmp.c ft_strlen.c ft_strlcpy.c ft_strlcat.c ft_strchr.c ft_strrchr.c \
	ft_strnstr.c ft_strncmp.c ft_strcmp.c ft_atoi.c ft_isalpha.c ft_isdigit.c ft_isalnum.c \
	ft_isascii.c ft_isprint.c ft_toupper.c ft_tolower.c ft_calloc.c ft_strdup.c \
	ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c \
	ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c

# add ft_printf src files to the SRC variable
FT_PRINTF_SRC = ft_printf.c ft_conversion_c.c ft_conversion_s.c ft_convert.c ft_flags.c \
	ft_putnbr.c ft_putlnbr.c ft_conversion_d_i.c ft_conversion_l_d.c ft_conversion_u.c ft_field_width.c ft_precision.c \
	ft_putstr.c ft_conversion_p.c ft_conversion_x.c ft_flag_zero.c ft_printf.c ft_uitoa.c
# add prefix
# add ft_printf src files to the SRC variable
SRC += $(addprefix ft_printf/, $(FT_PRINTF_SRC))


OBJ=ft_memset.o ft_bzero.o ft_memcpy.o ft_memccpy.o ft_memmove.o ft_memchr.o \
	ft_memcmp.o ft_strlen.o ft_strlcpy.o ft_strlcat.o ft_strchr.o ft_strrchr.o \
	ft_strnstr.o ft_strncmp.o ft_strcmp.o ft_atoi.o ft_isalpha.o ft_isdigit.o ft_isalnum.o \
	ft_isascii.o ft_isprint.o ft_toupper.o ft_tolower.o ft_calloc.o ft_strdup.o \
	ft_substr.o ft_strjoin.o ft_strtrim.o ft_split.o ft_itoa.o ft_strmapi.o \
	ft_putchar_fd.o ft_putstr_fd.o ft_putendl_fd.o ft_putnbr_fd.o

FT_PRINTF_OBJ = $(FT_PRINTF_SRC:.c=.o)
OBJ += $(FT_PRINTF_OBJ)

NAME=libft.a

BSRC=ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstsize_bonus.c \
	ft_lstlast_bonus.c ft_lstadd_back_bonus.c ft_lstdelone.c \
	ft_lstclear_bonus.c ft_lstiter_bonus.c ft_lstmap_bonus.c

BOBJ=ft_lstnew_bonus.o ft_lstadd_front_bonus.o ft_lstsize_bonus.o \
	ft_lstlast_bonus.o ft_lstadd_back_bonus.o ft_lstdelone.o \
	ft_lstclear_bonus.o ft_lstiter_bonus.o ft_lstmap_bonus.o

$(NAME): all
FLAGS=-Wall -Werror -Wextra
all:
	@gcc $(FLAGS) -c $(SRC) -I. -Ift_printf
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)

bonus:
	@gcc $(FLAGS) -c $(SRC) $(BSRC) -I.
	@ar rc $(NAME) $(OBJ) $(BOBJ)
	@ranlib $(NAME)	

clean:
	@rm -f *.o

fclean: clean
	@rm -f $(NAME)

re: fclean all

.PHONY: fclean clean all bonus re