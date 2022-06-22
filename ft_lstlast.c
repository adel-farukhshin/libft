#include "libft.h"

t_list	*ft_lstlast(t_list *lst)
{
	if (lst)
		while (lst->next->next)
			lst = lst->next;
	return (lst);
}
