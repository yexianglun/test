//链表操作
//1.寻找链表中点
```c++
	void find_middle(ListNode*head){
		ListNode*slow=head,*cur=head,*fast=head;
		while(fast&&fast->next){
			cur=slow;
			slow=slow->next;
			fast=fast->next->next;
		}
		cur->next=NULL;
		//head 和slow分别是链表的分离后的端点
	
	}
```
