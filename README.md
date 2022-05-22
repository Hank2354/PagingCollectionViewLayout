![Header](https://i.imgur.com/wUzTh5h.png)

# PagingCollectionViewLayout

- [About](#About-warning)
- [How to use](#How-to-use-key)

## About :warning:

Custom class, which is inherited from UICollectionViewFlowLayout, developed for properly work CollectionView paging mode

When using `collectionView.isPagingEnabled = true` 
The offset is not calculated correctly, and we get not what we wanted.

This solution fixes the issue and we can get the correctly work of This paging mode of collectionView

comparison below

| `collectionView.isPagingEnabled = true` | `PagingCollectionViewLayout` |
|:---------:|:---------:|
| ![](https://i.imgur.com/mCwbdiW.gif) | ![](https://i.stack.imgur.com/W6bqM.gif) |

MARK: When use PagingCollectionViewLayout, shoud be set `collectionView.isPagingEnabled = false`

You can also look at the demo, sometimes it's better than any words :smile:

## How to use :key:

- Download `PagingCollectionViewLayout.swift` and install in your project

- When create collectionView you just need to create layout of collectionView as PagingCollectionViewLayout class

For example:

```
let layout = PagingCollectionViewLayout()
let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
```

Additional settings are not required, set the values of indents and other settings to your liking
