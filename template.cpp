#include<bits/stdc++.h>
using namespace std;

#ifdef LOCAL
template<class A, class B> ostream& operator<<(ostream&, const pair<A, B>&);
template<class T, class = decltype(begin(declval<T>())), class = typename enable_if<!is_convertible<T, string>::value>::type>
ostream& operator<<(ostream& o, const T& v) { o << '{'; string s; for (const auto& x : v) o << s << x, s = ", "; return o << '}'; }
template<class A, class B> ostream& operator<<(ostream& o, const pair<A, B>& p) { return o << '(' << p.first << ", " << p.second << ')'; }
void dbg_out() { cerr << endl; }
template<class H, class... T> void dbg_out(const H& h, const T&... t) { cerr << ' ' << h; dbg_out(t...); }
#define dbg(...) cerr << "[" << #__VA_ARGS__ << "]:", dbg_out(__VA_ARGS__)
#else
#define dbg(...)
#endif

#define all(x) (x).begin(), (x).end()
#define rall(x) (x).rbegin(), (x).rend()
#define qfor(i,a,b) for(int i = a; i < b; i++)
#define mset(v, x) memset((v), (x), sizeof(v))
#define vcin(v) for(auto &x : (v)) cin >> x
#define vcout(v) for(const auto &x : (v)) cout << x

using ll = long long;
using vi = vector<int>;
using vll = vector<ll>;
using vvi = vector<vi>;
using ar2 = array<int, 2>;
using ar3 = array<int, 3>;
using var2 = vector<ar2>;
using var3 = vector<ar3>;

#define el << "\n"
#define es << " "
#define ss << " " <<

void solve() {
    
}

int main(){
    ios::sync_with_stdio(false);
    cin.tie(NULL);

    int t = 1;
    //cin >> t;
    while (t--) solve();

    return 0;
}
