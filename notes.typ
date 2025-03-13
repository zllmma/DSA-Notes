#set text(font: ("New Computer Modern", "Noto Serif CJK SC"), size: 14pt)

#set heading(numbering: "1.1")

= 绪论
== 算法的特点
- 输入
- 输出
- 正确性
- 确定性
- 可行性
- 有穷性
== 渐进复杂度：大 $O$，大 $Omega$，大 $Theta$
- 定义 $T(n) = O(f(n))$ 当且仅当 $exists space c > 0 $，使得 $T(n) <= c dot f(n)$，对于 $forall n >> 2$ 均成立
  - 大 $O$ 符号反应了函数增长速度的上界（最常用）

- 同理可定义大 $Omega$ 符号： $T(n) = Omega(f(n))$ 当且仅当 $exists space c > 0 $，使得 $T(n) >= c dot f(n)$，对于 $forall n >> 2$ 均成立
  - 反应增长速度的下界

- 大 $Theta$：$T(n) = Theta(f(n))$ 当且仅当 $exists space c_1, c_2 > 0 $，使得 $c_1 dot f(n) <= T(n) <= c_2 dot f(n)$，对于 $forall n >> 2$ 均成立
  - 较精确的刻画了增长速度

=== $O(1)$ ：常数
通常对应计算模型中的一个或常数个基本操作，效率最高

- 可能包含循环，包含分支，包含递归调用

- $O(log^*(n))$ ：*接近*常数（多重对数函数：就是对一个数连续取对数，最终使其小于等于1，返回取对数的次数，$log^*(2^1024) = 5$，可见其增长之慢）\
  ```cpp
  for(i = 0; i < n; i = 1 << i) // log*(n)
  ```
=== $O(log^c (n))$ ：对数多项式
- 非常有效，复杂度接近常数 $forall c > 0，log n = O(n^c)$
- 常底数，常数次幂无所谓

=== $O(n^c)$：多项式
- 效率可令人满意（P难度）
- 抓最高次幂

=== $O(2^n)$：指数
- 通常认为不可接受
- 从 $O(n^c)$ 到 $O(2^n)$ ，是从有效算法到无效算法的分水岭
- 严格的来讲，这类方法只能算程序，而非算法
- 例：SubsetSum问题，最坏情况下，需要检视所有一共 $2^n$ 个子集
  - 该问题不存在可在多项式时间内解决的算法（NP-complete）

== 迭代时间复杂度：级数
+ 幂方级数：比幂次高出一阶
  $
    &sum_(k = 0)^(n) k^d approx integral_0^n x^d dif x = O(n^(d + 1))\
    =>& sum_(k = 0)^(n) k = 1+2+3+dots+n = O(n^2)\
    =>& sum_(k = 0)^(n) k^2 = 1^2+2^2+3^2+n^2 =O(n^3)\
    =>& dots
  $

+ 几何级数：与末项同阶
  $
    sum_(k = 0)^(n) alpha^k = 1+alpha+alpha^2+dots+alpha^n = O(alpha^n) quad (alpha > 1)
  $
  注意：
  $
    1+2+4+dots+n = O(n)
  $

+ 调和级数
  $
    h(n) = sum_(k = 0)^(n) 1 / k = 1+1 / 2+1 / 3+dots+1 / n = Theta(log n)
  $
+ 对数级数
  $
    sum_(k = 1)^(n) log k = log n! = O(n log(n))
  $

== 递归时间复杂度：减而治之
例：计算前 $n$ 个自然数的和，可以用前 $n-1$ 个数的和加上当前的数，即 ```cpp sum(n) = n + sum(n - 1) ``` ，且 ```cpp sum(0) = 0 ```

这就是*减而治之*：求解一个大规模问题可将其分解为一个平凡的子问题和一个规模缩小的子问题，然后递归的求解子问题，最后由子问题的解得到原问题的解

- 如何求解时间复杂度？
  - 递归跟踪：得到所有递归实例，并计算出他们运行时间的总和，$T(n) = (n-1)*O(1) = O(n)$
  - 求解递推方程：$T(n) = T(n-1)+O(1), quad T(0) = O(1)$

- 空间复杂度？
  - 通常等于递归深度
- 例：数组倒置
  ```cpp
  void reverse(int *A, int n) {
    if (n < 2) return;
    swap(A[0], A[n-1]);
    reverse(A + 1, n - 2);
  }
  ```
  这是一个尾递归，可以转化为迭代，以缩减空间复杂度：
  ```cpp
  void reverse(int *A, int n) {
    while (n > 1) {
        swap(A[0], A[n - 1]);
    }
    A++;
    n = n - 2;
  }
  ```

== 递归时间复杂度：分而治之

求解一个大规模问题可将其分解若干个*规模相当*的子问题，然后递归的求解子问题，最后由子问题的解得到原问题的解

例：数组区间求和
```cpp
int sum(int *A, int lo, int hi) {
    if (hi - lo < 2) return A[lo];
    int mi = (lo + hi) / 2;
    return sum(A, lo, mi) + sum(A, mi, hi);
}
```
- 时间复杂度
  - 递归跟踪 $T(n) = 1 + 2 + 4 + dots + n = O(n)$
  - 递推方程 $T(n) = 2 dot T(n\/2) + O(1)$
- 空间复杂度 $O(log n)$

== 如何求解分治递推方程：主定理
分治通常对应的表达式：$T(n) = a dot T(n \/ b) + O(g(n))$






= 向量

= 列表
