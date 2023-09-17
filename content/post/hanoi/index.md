---
title: "Hanoi"
date: 2023-09-15T20:00:46-05:00
draft: false
Description: ""
Tags: []
Categories: []
---
{{% details "table of values" %}}
```
0000 0000
0001 0002
0010 0012
0011 0011

0100 0211
0101 0210
0110 0220
0111 0222

1000 1222
1001 1221
1010 1201
1011 1200

1100 1100
1101 1102
1110 1112
1111 1111
```
{{% /details%}}

```python
def tower(ring, time):
    return ((-1) ** ring * time + (1 << ring) >> (ring + 1)) % 3
```
```javascript
    x =  ((-1) ** ring * time + (1 << ring) >> (ring + 1)) % 3
    return (x + 3) % 3
```

{{< hanoi >}}