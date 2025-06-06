## v2.2.1

> ### Fixed:
>
> - Improved `TreeBuilder` utility: Items whose `parentId` does not exist in the list are now treated as root nodes. This ensures all items are included in the tree, even if their parent is missing from the input list.

## v2.2.0

> ### Added:
>
> - **StringEllipsSize**: Returns a new string truncated from the start or end to the specified maximum length.
>
> - **GroupedRadioButton**: A widget that displays a group of radio buttons.

## v2.1.2

- example added

## v2.1.1

- bugfixes

## v2.1.0

> ### Added:
>
> - **new Extension**: WidgetsSeparator an extension that can be used to add a separator between widgets in a `list<Widget>`.

## v2.0.0

> ### Added:
>
> - `<T> data` property added to `TreeOutPutItem`.

> ### Removed:
>
> - `item` property of `TreeOutPutItem` removed.

## v1.0.0

> ### Added:
>
> - `TreeBuilder` a utility class for building structured parent-child relationships.
