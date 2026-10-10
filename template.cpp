#include<bits/stdc++.h>
using namespace std;

template<class T> void _p(const T& x) {
    if constexpr (requires { cerr << x; }) cerr << x;
    else { cerr << "{ "; for_each((x).begin(), (x).end(), [](auto& e) { _p(e); cerr << ' '; }); cerr << '}'; }
}
template<class... T> void _dbg(const char* s, const T&... x) { cerr << s << " ="; ((cerr << ' ', _p(x)), ...); cerr << '\n'; }
#define dbg(...) _dbg(#__VA_ARGS__, __VA_ARGS__)
// #define dbg(...)

#define all(x) (x).begin(), (x).end()
#define rall(x) (x).rbegin(), (x).rend()
#define qfor(i,a,b) for(int i =a; i < b; i++)
#define vcin(v) for(auto &x:(v)) cin >> x

using ll = long long;
using vi = vector<int>;
using vll = vector<ll>;
using vvi = vector<vi>;
using vpii = vector<pair<int,int>>;

#define EL << "\n"
#define ES << " "
#define SS << " " <<

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
