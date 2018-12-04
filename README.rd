//链表操作
//1.寻找链表中点
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
//链表的归并排序(时间复杂度为O(nlgn))
class Solution{
	public:	
		ListNode*sortList(ListNode*head){
			//递归退出条件(head为空或者head只有一个元素时退出)
			if(!head||!head->next)return head;
			//先找出链表的中点
			ListNode*cur=head,*slow=head,*fast=head;
			while(fast&&fast->next){
				cur=slow;
				slow=slow->next;
				fast=fast->next->next;		
			}
			cur->next=NULL;
			//递归
			return merge(sortList(head),sortList(slow));
			
		}
		ListNode*merge(ListNode*l1,ListNode*l2){
			ListNode*dummy=new ListNode(-1);
			ListNode*cur=dummy;
			while(l1&&l2){
				if(l1->val<l2->val){
					cur->next=l1;
					l1=l1->next;
				}else{
					cur->next=l2;
					l2=l2->next;
				}
				cur=cur->next;
			}
			if(l1)cur->next=l1;
			if(l2)cur->next=l2;
			return dummy->next;
		}
};
//链表倒序 1-2-3-4 倒序后为4-3-2-1
class Solution{
	public:
		ListNode*reverseList(ListNode*head){
			if(!head)return head;
			ListNode *dummy = new ListNode(-1);
			dummy->next = head;
			ListNode *cur = head;
			while (cur->next) {
				ListNode *tmp = cur->next;
				cur->next = tmp->next;           
                tmp->next = dummy->next;
				dummy->next = tmp;
			}
			return dummy->next;
		} 		
};