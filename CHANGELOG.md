## v2.2.3

> ### Improved:
>
> - Updated `README.md`: Extensions section now lists all `WidgetsSeparator` methods and includes a showcase image placeholder for better documentation and discoverability.

## v2.2.2

> ### Added:
>
> - **New extension method:** `WidgetsSeparator.withWidgetInBetween` on `List<Widget>`. Easily insert any custom widget between all items in a widget list.
>
> - **Improved:** `WidgetsSeparator` functionality has been improved and refactored for better usability.

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
