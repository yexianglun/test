//链表操作
//1.寻找链表中点
void find_middle(ListNode*head){	
	ListNode*slow=head,*cur=head,*fast=head;	
	while(fast->next&&fast->next){		
		cur=slow;		
		slow=slow->next;		
		fast=fast->next->next;		
	}
	cur->next=NULL;	
	//head 和slow分别是链表的分离后的端点	
}

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

//链表移动
//1-2-3-4-5    向右移动2位   则第一次：  5-1-2-3-4  第二次  4-5-1-2-3
class Solution{
	public:
		ListNode*rorateRight(ListNode*head,int k){
			//找出链表的深度
			int n=0;
			ListNode*cur=head;
			while(cur){
				n++;
				cur=cur->next;
			}
			k%=n;
			//设计快慢指针,让快指针先走k步后快慢指针再一起走
			ListNode*slow=head,*fast=head;
			for(int i=0;i<k;i++){
				if(fast)fast=fast->next;
			}
			if(!fast)return head;
			//再一起走
			while(fast->next){
				fast=fast->next;
				slow=slow->next;
			}
			fast->next=head;
			fast=slow->next;
			slow->next=NULL;
		}
		return fast;
};
//删除链表的节点
class Solution{
	public:
		ListNode*deleNode(ListNode*head,int val){
			ListNode*dummy=new ListNode(-1);
			ListNode*cur=dummy;
			dummy->next=head;
			while(cur->next){
				if(cur->next->val==val){
					ListNode*tmp=cur->next;
					cur->next=tmp->next;
					tmp->next=NULL;
					delete tmp;
				}else{
					cur=cur->next;
				}
			}
			return dummy->next;
		}
};
//删除重复元素  1-1-2-3-4-4  1-2-3-4
class Solution{
	public:
		ListNode* deleteDuplicates(ListNode* head) {
			ListNode*dummy=new ListNode(-1);
			dummy->next=head;
			ListNode*cur=dummy;
			while(cur->next&&cur->next->next){
				if(cur->next->val==cur->next->next->val){
					ListNode*tmp=cur->next;
					cur->next=tmp->next;
					tmp->next=NULL;
					delete tmp;
				}else{
					cur=cur->next;
				}
			}return dummy->next;
		}
};
//环形链表
//快慢指针的经典应用
class Solution{
	public:
		bool hasCycle(ListNode*head){
			ListNode*slow=head,*fast=head;
			while(fast&&fast->next){
				fast=fast->next->next;
				slow=slow->next;
				if(fast==slow)return true;
			}
			return false;
		}
};
//判断对称链表
bool isPalindrome(ListNode*head){
	if(!head||!head->next)return true;
	ListNode* slow=head,*fast=head,*cur=head;
	while(fast->next&&fast->next->next){
		cur=slow;
		slow=slow->next;
		fast=fast->next->next;
	}
	ListNode*pre=head,*last=slow->next;
	while(last->next){		
			
		ListNode*tmp=last->next;
		last->next=tmp->next;
		tmp->next=slow->next;
		slow->next=tmp;		
	}
	while(slow->next){
		slow=slow->next;
		if(slow->val!=pre->val)return false;
		pre=pre->next;
	}
	return true;
};


