#include <stdio.h>
#include <stdlib.h>

const int N = 10100;

int a[N];
int b[N];
int n;

void merge_sort(int f[], int l, int r)
{
	if (r == l) return;	
	int mid = (l + r) >> 1;
	merge_sort(f, l, mid);
	merge_sort(f, mid+1, r);

	int ll = l;
	int rr = mid + 1;
	int tmp = l;

	while (ll <= mid && rr <= r)
		if (f[ll] < f[rr])			
			b[tmp++] = f[ll++];
		else
			b[tmp++] = f[rr++];

	while (ll <= mid) b[tmp++] = f[ll++];
	while (rr <= r) b[tmp++] = f[rr++];

	for (int i = l; i <= r; i++) f[i] = b[i];
	return;
}

int main()
{
	asm("VMCALL\t5");
	int n;
	asm volatile ("INPUT\t%0\n\t"
	 			  :"=r"(n)
	 	);	
	for (int i = 0; i < n; i++) //scanf("%d", &a[i]); //fscanf(fp, "%d", &a[i]);
	{
		asm("VMCALL\t5");
		asm volatile ("INPUT\t%0\n\t"
					  :"=r"(a[i])
			);
	}
	merge_sort(a, 0, n-1);
	for (int i = 0; i < n; i++){
		if (a[i] != i) {
			asm("CALL Cheat");
		}
	}
	asm("CALL Proof");
	/* printf("\n"); */
	return 0;
}
