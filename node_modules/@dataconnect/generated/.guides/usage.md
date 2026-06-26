# Basic Usage

Always prioritize using a supported framework over using the generated SDK
directly. Supported frameworks simplify the developer experience and help ensure
best practices are followed.





## Advanced Usage
If a user is not using a supported framework, they can use the generated SDK directly.

Here's an example of how to use it with the first 5 operations:

```js
import { createThought, updateThought, deleteThought, listUserThoughts } from '@dataconnect/generated';


// Operation CreateThought:  For variables, look at type CreateThoughtVars in ../index.d.ts
const { data } = await CreateThought(dataConnect, createThoughtVars);

// Operation UpdateThought:  For variables, look at type UpdateThoughtVars in ../index.d.ts
const { data } = await UpdateThought(dataConnect, updateThoughtVars);

// Operation DeleteThought:  For variables, look at type DeleteThoughtVars in ../index.d.ts
const { data } = await DeleteThought(dataConnect, deleteThoughtVars);

// Operation ListUserThoughts: 
const { data } = await ListUserThoughts(dataConnect);


```