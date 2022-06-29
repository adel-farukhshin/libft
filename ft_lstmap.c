#include "libft.h"

t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *))
{
	t_list	*start;
	t_list	*new;

	start = NULL;
	while (lst)
	{
		new = ft_lstnew((*f)(lst->content));
		if (!new)
		{
			while (start)
			{
				new = start->next;
				(*del)(start->content);
				free(start);
				start = new;
			}
		}
		ft_lstadd_back(&start, new);
		lst = lst->next;
	}
	return (start);
}
