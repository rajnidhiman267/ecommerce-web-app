# Generated TypeScript README
This README will guide you through the process of using the generated JavaScript SDK package for the connector `example`. It will also provide examples on how to use your generated SDK to call your Data Connect queries and mutations.

***NOTE:** This README is generated alongside the generated SDK. If you make changes to this file, they will be overwritten when the SDK is regenerated.*

# Table of Contents
- [**Overview**](#generated-javascript-readme)
- [**Accessing the connector**](#accessing-the-connector)
  - [*Connecting to the local Emulator*](#connecting-to-the-local-emulator)
- [**Queries**](#queries)
  - [*ListUserThoughts*](#listuserthoughts)
- [**Mutations**](#mutations)
  - [*CreateThought*](#createthought)
  - [*UpdateThought*](#updatethought)
  - [*DeleteThought*](#deletethought)

# Accessing the connector
A connector is a collection of Queries and Mutations. One SDK is generated for each connector - this SDK is generated for the connector `example`. You can find more information about connectors in the [Data Connect documentation](https://firebase.google.com/docs/data-connect#how-does).

You can use this generated SDK by importing from the package `@dataconnect/generated` as shown below. Both CommonJS and ESM imports are supported.

You can also follow the instructions from the [Data Connect documentation](https://firebase.google.com/docs/data-connect/web-sdk#set-client).

```typescript
import { getDataConnect } from 'firebase/data-connect';
import { connectorConfig } from '@dataconnect/generated';

const dataConnect = getDataConnect(connectorConfig);
```

## Connecting to the local Emulator
By default, the connector will connect to the production service.

To connect to the emulator, you can use the following code.
You can also follow the emulator instructions from the [Data Connect documentation](https://firebase.google.com/docs/data-connect/web-sdk#instrument-clients).

```typescript
import { connectDataConnectEmulator, getDataConnect } from 'firebase/data-connect';
import { connectorConfig } from '@dataconnect/generated';

const dataConnect = getDataConnect(connectorConfig);
connectDataConnectEmulator(dataConnect, 'localhost', 9399);
```

After it's initialized, you can call your Data Connect [queries](#queries) and [mutations](#mutations) from your generated SDK.

# Queries

There are two ways to execute a Data Connect Query using the generated Web SDK:
- Using a Query Reference function, which returns a `QueryRef`
  - The `QueryRef` can be used as an argument to `executeQuery()`, which will execute the Query and return a `QueryPromise`
- Using an action shortcut function, which returns a `QueryPromise`
  - Calling the action shortcut function will execute the Query and return a `QueryPromise`

The following is true for both the action shortcut function and the `QueryRef` function:
- The `QueryPromise` returned will resolve to the result of the Query once it has finished executing
- If the Query accepts arguments, both the action shortcut function and the `QueryRef` function accept a single argument: an object that contains all the required variables (and the optional variables) for the Query
- Both functions can be called with or without passing in a `DataConnect` instance as an argument. If no `DataConnect` argument is passed in, then the generated SDK will call `getDataConnect(connectorConfig)` behind the scenes for you.

Below are examples of how to use the `example` connector's generated functions to execute each query. You can also follow the examples from the [Data Connect documentation](https://firebase.google.com/docs/data-connect/web-sdk#using-queries).

## ListUserThoughts
You can execute the `ListUserThoughts` query using the following action shortcut function, or by calling `executeQuery()` after calling the following `QueryRef` function, both of which are defined in [dataconnect-generated/index.d.ts](./index.d.ts):
```typescript
listUserThoughts(options?: ExecuteQueryOptions): QueryPromise<ListUserThoughtsData, undefined>;

interface ListUserThoughtsRef {
  ...
  /* Allow users to create refs without passing in DataConnect */
  (): QueryRef<ListUserThoughtsData, undefined>;
}
export const listUserThoughtsRef: ListUserThoughtsRef;
```
You can also pass in a `DataConnect` instance to the action shortcut function or `QueryRef` function.
```typescript
listUserThoughts(dc: DataConnect, options?: ExecuteQueryOptions): QueryPromise<ListUserThoughtsData, undefined>;

interface ListUserThoughtsRef {
  ...
  (dc: DataConnect): QueryRef<ListUserThoughtsData, undefined>;
}
export const listUserThoughtsRef: ListUserThoughtsRef;
```

If you need the name of the operation without creating a ref, you can retrieve the operation name by calling the `operationName` property on the listUserThoughtsRef:
```typescript
const name = listUserThoughtsRef.operationName;
console.log(name);
```

### Variables
The `ListUserThoughts` query has no variables.
### Return Type
Recall that executing the `ListUserThoughts` query returns a `QueryPromise` that resolves to an object with a `data` property.

The `data` property is an object of type `ListUserThoughtsData`, which is defined in [dataconnect-generated/index.d.ts](./index.d.ts). It has the following fields:
```typescript
export interface ListUserThoughtsData {
  thoughts: ({
    id: UUIDString;
    content: string;
    status: string;
    createdAt: TimestampString;
    priority?: number | null;
  } & Thought_Key)[];
}
```
### Using `ListUserThoughts`'s action shortcut function

```typescript
import { getDataConnect } from 'firebase/data-connect';
import { connectorConfig, listUserThoughts } from '@dataconnect/generated';


// Call the `listUserThoughts()` function to execute the query.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await listUserThoughts();

// You can also pass in a `DataConnect` instance to the action shortcut function.
const dataConnect = getDataConnect(connectorConfig);
const { data } = await listUserThoughts(dataConnect);

console.log(data.thoughts);

// Or, you can use the `Promise` API.
listUserThoughts().then((response) => {
  const data = response.data;
  console.log(data.thoughts);
});
```

### Using `ListUserThoughts`'s `QueryRef` function

```typescript
import { getDataConnect, executeQuery } from 'firebase/data-connect';
import { connectorConfig, listUserThoughtsRef } from '@dataconnect/generated';


// Call the `listUserThoughtsRef()` function to get a reference to the query.
const ref = listUserThoughtsRef();

// You can also pass in a `DataConnect` instance to the `QueryRef` function.
const dataConnect = getDataConnect(connectorConfig);
const ref = listUserThoughtsRef(dataConnect);

// Call `executeQuery()` on the reference to execute the query.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await executeQuery(ref);

console.log(data.thoughts);

// Or, you can use the `Promise` API.
executeQuery(ref).then((response) => {
  const data = response.data;
  console.log(data.thoughts);
});
```

# Mutations

There are two ways to execute a Data Connect Mutation using the generated Web SDK:
- Using a Mutation Reference function, which returns a `MutationRef`
  - The `MutationRef` can be used as an argument to `executeMutation()`, which will execute the Mutation and return a `MutationPromise`
- Using an action shortcut function, which returns a `MutationPromise`
  - Calling the action shortcut function will execute the Mutation and return a `MutationPromise`

The following is true for both the action shortcut function and the `MutationRef` function:
- The `MutationPromise` returned will resolve to the result of the Mutation once it has finished executing
- If the Mutation accepts arguments, both the action shortcut function and the `MutationRef` function accept a single argument: an object that contains all the required variables (and the optional variables) for the Mutation
- Both functions can be called with or without passing in a `DataConnect` instance as an argument. If no `DataConnect` argument is passed in, then the generated SDK will call `getDataConnect(connectorConfig)` behind the scenes for you.

Below are examples of how to use the `example` connector's generated functions to execute each mutation. You can also follow the examples from the [Data Connect documentation](https://firebase.google.com/docs/data-connect/web-sdk#using-mutations).

## CreateThought
You can execute the `CreateThought` mutation using the following action shortcut function, or by calling `executeMutation()` after calling the following `MutationRef` function, both of which are defined in [dataconnect-generated/index.d.ts](./index.d.ts):
```typescript
createThought(vars: CreateThoughtVariables): MutationPromise<CreateThoughtData, CreateThoughtVariables>;

interface CreateThoughtRef {
  ...
  /* Allow users to create refs without passing in DataConnect */
  (vars: CreateThoughtVariables): MutationRef<CreateThoughtData, CreateThoughtVariables>;
}
export const createThoughtRef: CreateThoughtRef;
```
You can also pass in a `DataConnect` instance to the action shortcut function or `MutationRef` function.
```typescript
createThought(dc: DataConnect, vars: CreateThoughtVariables): MutationPromise<CreateThoughtData, CreateThoughtVariables>;

interface CreateThoughtRef {
  ...
  (dc: DataConnect, vars: CreateThoughtVariables): MutationRef<CreateThoughtData, CreateThoughtVariables>;
}
export const createThoughtRef: CreateThoughtRef;
```

If you need the name of the operation without creating a ref, you can retrieve the operation name by calling the `operationName` property on the createThoughtRef:
```typescript
const name = createThoughtRef.operationName;
console.log(name);
```

### Variables
The `CreateThought` mutation requires an argument of type `CreateThoughtVariables`, which is defined in [dataconnect-generated/index.d.ts](./index.d.ts). It has the following fields:

```typescript
export interface CreateThoughtVariables {
  content: string;
  status: string;
}
```
### Return Type
Recall that executing the `CreateThought` mutation returns a `MutationPromise` that resolves to an object with a `data` property.

The `data` property is an object of type `CreateThoughtData`, which is defined in [dataconnect-generated/index.d.ts](./index.d.ts). It has the following fields:
```typescript
export interface CreateThoughtData {
  thought_insert: Thought_Key;
}
```
### Using `CreateThought`'s action shortcut function

```typescript
import { getDataConnect } from 'firebase/data-connect';
import { connectorConfig, createThought, CreateThoughtVariables } from '@dataconnect/generated';

// The `CreateThought` mutation requires an argument of type `CreateThoughtVariables`:
const createThoughtVars: CreateThoughtVariables = {
  content: ..., 
  status: ..., 
};

// Call the `createThought()` function to execute the mutation.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await createThought(createThoughtVars);
// Variables can be defined inline as well.
const { data } = await createThought({ content: ..., status: ..., });

// You can also pass in a `DataConnect` instance to the action shortcut function.
const dataConnect = getDataConnect(connectorConfig);
const { data } = await createThought(dataConnect, createThoughtVars);

console.log(data.thought_insert);

// Or, you can use the `Promise` API.
createThought(createThoughtVars).then((response) => {
  const data = response.data;
  console.log(data.thought_insert);
});
```

### Using `CreateThought`'s `MutationRef` function

```typescript
import { getDataConnect, executeMutation } from 'firebase/data-connect';
import { connectorConfig, createThoughtRef, CreateThoughtVariables } from '@dataconnect/generated';

// The `CreateThought` mutation requires an argument of type `CreateThoughtVariables`:
const createThoughtVars: CreateThoughtVariables = {
  content: ..., 
  status: ..., 
};

// Call the `createThoughtRef()` function to get a reference to the mutation.
const ref = createThoughtRef(createThoughtVars);
// Variables can be defined inline as well.
const ref = createThoughtRef({ content: ..., status: ..., });

// You can also pass in a `DataConnect` instance to the `MutationRef` function.
const dataConnect = getDataConnect(connectorConfig);
const ref = createThoughtRef(dataConnect, createThoughtVars);

// Call `executeMutation()` on the reference to execute the mutation.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await executeMutation(ref);

console.log(data.thought_insert);

// Or, you can use the `Promise` API.
executeMutation(ref).then((response) => {
  const data = response.data;
  console.log(data.thought_insert);
});
```

## UpdateThought
You can execute the `UpdateThought` mutation using the following action shortcut function, or by calling `executeMutation()` after calling the following `MutationRef` function, both of which are defined in [dataconnect-generated/index.d.ts](./index.d.ts):
```typescript
updateThought(vars: UpdateThoughtVariables): MutationPromise<UpdateThoughtData, UpdateThoughtVariables>;

interface UpdateThoughtRef {
  ...
  /* Allow users to create refs without passing in DataConnect */
  (vars: UpdateThoughtVariables): MutationRef<UpdateThoughtData, UpdateThoughtVariables>;
}
export const updateThoughtRef: UpdateThoughtRef;
```
You can also pass in a `DataConnect` instance to the action shortcut function or `MutationRef` function.
```typescript
updateThought(dc: DataConnect, vars: UpdateThoughtVariables): MutationPromise<UpdateThoughtData, UpdateThoughtVariables>;

interface UpdateThoughtRef {
  ...
  (dc: DataConnect, vars: UpdateThoughtVariables): MutationRef<UpdateThoughtData, UpdateThoughtVariables>;
}
export const updateThoughtRef: UpdateThoughtRef;
```

If you need the name of the operation without creating a ref, you can retrieve the operation name by calling the `operationName` property on the updateThoughtRef:
```typescript
const name = updateThoughtRef.operationName;
console.log(name);
```

### Variables
The `UpdateThought` mutation requires an argument of type `UpdateThoughtVariables`, which is defined in [dataconnect-generated/index.d.ts](./index.d.ts). It has the following fields:

```typescript
export interface UpdateThoughtVariables {
  id: UUIDString;
  status: string;
}
```
### Return Type
Recall that executing the `UpdateThought` mutation returns a `MutationPromise` that resolves to an object with a `data` property.

The `data` property is an object of type `UpdateThoughtData`, which is defined in [dataconnect-generated/index.d.ts](./index.d.ts). It has the following fields:
```typescript
export interface UpdateThoughtData {
  thought_update?: Thought_Key | null;
}
```
### Using `UpdateThought`'s action shortcut function

```typescript
import { getDataConnect } from 'firebase/data-connect';
import { connectorConfig, updateThought, UpdateThoughtVariables } from '@dataconnect/generated';

// The `UpdateThought` mutation requires an argument of type `UpdateThoughtVariables`:
const updateThoughtVars: UpdateThoughtVariables = {
  id: ..., 
  status: ..., 
};

// Call the `updateThought()` function to execute the mutation.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await updateThought(updateThoughtVars);
// Variables can be defined inline as well.
const { data } = await updateThought({ id: ..., status: ..., });

// You can also pass in a `DataConnect` instance to the action shortcut function.
const dataConnect = getDataConnect(connectorConfig);
const { data } = await updateThought(dataConnect, updateThoughtVars);

console.log(data.thought_update);

// Or, you can use the `Promise` API.
updateThought(updateThoughtVars).then((response) => {
  const data = response.data;
  console.log(data.thought_update);
});
```

### Using `UpdateThought`'s `MutationRef` function

```typescript
import { getDataConnect, executeMutation } from 'firebase/data-connect';
import { connectorConfig, updateThoughtRef, UpdateThoughtVariables } from '@dataconnect/generated';

// The `UpdateThought` mutation requires an argument of type `UpdateThoughtVariables`:
const updateThoughtVars: UpdateThoughtVariables = {
  id: ..., 
  status: ..., 
};

// Call the `updateThoughtRef()` function to get a reference to the mutation.
const ref = updateThoughtRef(updateThoughtVars);
// Variables can be defined inline as well.
const ref = updateThoughtRef({ id: ..., status: ..., });

// You can also pass in a `DataConnect` instance to the `MutationRef` function.
const dataConnect = getDataConnect(connectorConfig);
const ref = updateThoughtRef(dataConnect, updateThoughtVars);

// Call `executeMutation()` on the reference to execute the mutation.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await executeMutation(ref);

console.log(data.thought_update);

// Or, you can use the `Promise` API.
executeMutation(ref).then((response) => {
  const data = response.data;
  console.log(data.thought_update);
});
```

## DeleteThought
You can execute the `DeleteThought` mutation using the following action shortcut function, or by calling `executeMutation()` after calling the following `MutationRef` function, both of which are defined in [dataconnect-generated/index.d.ts](./index.d.ts):
```typescript
deleteThought(vars: DeleteThoughtVariables): MutationPromise<DeleteThoughtData, DeleteThoughtVariables>;

interface DeleteThoughtRef {
  ...
  /* Allow users to create refs without passing in DataConnect */
  (vars: DeleteThoughtVariables): MutationRef<DeleteThoughtData, DeleteThoughtVariables>;
}
export const deleteThoughtRef: DeleteThoughtRef;
```
You can also pass in a `DataConnect` instance to the action shortcut function or `MutationRef` function.
```typescript
deleteThought(dc: DataConnect, vars: DeleteThoughtVariables): MutationPromise<DeleteThoughtData, DeleteThoughtVariables>;

interface DeleteThoughtRef {
  ...
  (dc: DataConnect, vars: DeleteThoughtVariables): MutationRef<DeleteThoughtData, DeleteThoughtVariables>;
}
export const deleteThoughtRef: DeleteThoughtRef;
```

If you need the name of the operation without creating a ref, you can retrieve the operation name by calling the `operationName` property on the deleteThoughtRef:
```typescript
const name = deleteThoughtRef.operationName;
console.log(name);
```

### Variables
The `DeleteThought` mutation requires an argument of type `DeleteThoughtVariables`, which is defined in [dataconnect-generated/index.d.ts](./index.d.ts). It has the following fields:

```typescript
export interface DeleteThoughtVariables {
  id: UUIDString;
}
```
### Return Type
Recall that executing the `DeleteThought` mutation returns a `MutationPromise` that resolves to an object with a `data` property.

The `data` property is an object of type `DeleteThoughtData`, which is defined in [dataconnect-generated/index.d.ts](./index.d.ts). It has the following fields:
```typescript
export interface DeleteThoughtData {
  thought_delete?: Thought_Key | null;
}
```
### Using `DeleteThought`'s action shortcut function

```typescript
import { getDataConnect } from 'firebase/data-connect';
import { connectorConfig, deleteThought, DeleteThoughtVariables } from '@dataconnect/generated';

// The `DeleteThought` mutation requires an argument of type `DeleteThoughtVariables`:
const deleteThoughtVars: DeleteThoughtVariables = {
  id: ..., 
};

// Call the `deleteThought()` function to execute the mutation.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await deleteThought(deleteThoughtVars);
// Variables can be defined inline as well.
const { data } = await deleteThought({ id: ..., });

// You can also pass in a `DataConnect` instance to the action shortcut function.
const dataConnect = getDataConnect(connectorConfig);
const { data } = await deleteThought(dataConnect, deleteThoughtVars);

console.log(data.thought_delete);

// Or, you can use the `Promise` API.
deleteThought(deleteThoughtVars).then((response) => {
  const data = response.data;
  console.log(data.thought_delete);
});
```

### Using `DeleteThought`'s `MutationRef` function

```typescript
import { getDataConnect, executeMutation } from 'firebase/data-connect';
import { connectorConfig, deleteThoughtRef, DeleteThoughtVariables } from '@dataconnect/generated';

// The `DeleteThought` mutation requires an argument of type `DeleteThoughtVariables`:
const deleteThoughtVars: DeleteThoughtVariables = {
  id: ..., 
};

// Call the `deleteThoughtRef()` function to get a reference to the mutation.
const ref = deleteThoughtRef(deleteThoughtVars);
// Variables can be defined inline as well.
const ref = deleteThoughtRef({ id: ..., });

// You can also pass in a `DataConnect` instance to the `MutationRef` function.
const dataConnect = getDataConnect(connectorConfig);
const ref = deleteThoughtRef(dataConnect, deleteThoughtVars);

// Call `executeMutation()` on the reference to execute the mutation.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await executeMutation(ref);

console.log(data.thought_delete);

// Or, you can use the `Promise` API.
executeMutation(ref).then((response) => {
  const data = response.data;
  console.log(data.thought_delete);
});
```

