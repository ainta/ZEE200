struct Node
{
	int sum;
	int l, r;
};

const int N = 100000;
struct Node t[N];

void Init(int l, int r, int now)
{
	t[now].l = l;
	t[now].r = r;	
	if (l == r)
	{
		t[now].sum = 1;
		return;
	}
	int mid = (l + r) >> 1;
	Init(l, mid, now*2);
	Init(mid+1, r, now*2+1);
	t[now].sum = t[now*2].sum + t[now*2+1].sum;
}

int Quote(int l, int r, int now)
{
	if (l > r) return 0;
	if (t[now].l == l && t[now].r == r) return t[now].sum;
	int mid = (t[now].l + t[now].r) >> 1;
	return Quote(l, r < mid ? r : mid, now*2) + Quote(mid+1 > l ? mid+1 : l, r, now*2+1);
}

int main()
{
	Init(1, 100, 1);
	int res = Quote(20, 40, 1);
	return res;
}
