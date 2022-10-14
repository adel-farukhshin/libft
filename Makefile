
project					:= libft.a

inc_dir					:= ./inc
src_dir					:= ./src
obj_dir					:= ./obj
dirs					:= ${inc_dir} ${src_dir}

sources					:= $(wildcard ${src_dir}/*.c)
objects					:= $(subst .c,.o,$(subst ${src_dir},${obj_dir},${sources}))
header					:= ${inc_dir}/libft.h

CC						:= cc
CFLAGS					:= -I${inc_dir} -g -Wall -Wextra -Werror -O0

.PHONY: all  clean fclean re 

all: ${project}

${project}: ${objects} 
	ar rc ${project} ${objects}

${obj_dir}/%.o: ${src_dir}/%.c ${header} | ${obj_dir}
	${CC} ${CFLAGS} -c -o ${@} ${<} 

${obj_dir}:
	mkdir -p ${@}

clean:
	rm -f ${objects}

fclean: clean
	rm -f ${project}

re: fclean all
