/// Merge sort implementation
pub fn merge_sort(f: &mut [i32], b: &mut [i32], l: usize, r: usize) {
    if r == l {
        return;
    }
    let mid = (l + r) >> 1;
    merge_sort(f, b, l, mid);
    merge_sort(f, b, mid + 1, r);

    let mut ll = l;
    let mut rr = mid + 1;
    let mut tmp = l;

    while ll <= mid && rr <= r {
        if f[ll] < f[rr] {
            b[tmp] = f[ll];
            ll += 1;
        } else {
            b[tmp] = f[rr];
            rr += 1;
        }
        tmp += 1;
    }

    while ll <= mid {
        b[tmp] = f[ll];
        ll += 1;
        tmp += 1;
    }
    while rr <= r {
        b[tmp] = f[rr];
        rr += 1;
        tmp += 1;
    }

    for i in l..=r {
        f[i] = b[i];
    }
}
