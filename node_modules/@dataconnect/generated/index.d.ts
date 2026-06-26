import { ConnectorConfig, DataConnect, QueryRef, QueryPromise, ExecuteQueryOptions, MutationRef, MutationPromise, DataConnectSettings } from 'firebase/data-connect';

export const connectorConfig: ConnectorConfig;
export const dataConnectSettings: DataConnectSettings;

export type TimestampString = string;
export type UUIDString = string;
export type Int64String = string;
export type DateString = string;




export interface Category_Key {
  id: UUIDString;
  __typename?: 'Category_Key';
}

export interface CreateThoughtData {
  thought_insert: Thought_Key;
}

export interface CreateThoughtVariables {
  content: string;
  status: string;
}

export interface DeleteThoughtData {
  thought_delete?: Thought_Key | null;
}

export interface DeleteThoughtVariables {
  id: UUIDString;
}

export interface ListUserThoughtsData {
  thoughts: ({
    id: UUIDString;
    content: string;
    status: string;
    createdAt: TimestampString;
    priority?: number | null;
  } & Thought_Key)[];
}

export interface ReflectSession_Key {
  id: UUIDString;
  __typename?: 'ReflectSession_Key';
}

export interface ThoughtCategory_Key {
  thoughtId: UUIDString;
  categoryId: UUIDString;
  __typename?: 'ThoughtCategory_Key';
}

export interface Thought_Key {
  id: UUIDString;
  __typename?: 'Thought_Key';
}

export interface UpdateThoughtData {
  thought_update?: Thought_Key | null;
}

export interface UpdateThoughtVariables {
  id: UUIDString;
  status: string;
}

export interface User_Key {
  id: UUIDString;
  __typename?: 'User_Key';
}

interface CreateThoughtRef {
  /* Allow users to create refs without passing in DataConnect */
  (vars: CreateThoughtVariables): MutationRef<CreateThoughtData, CreateThoughtVariables>;
  /* Allow users to pass in custom DataConnect instances */
  (dc: DataConnect, vars: CreateThoughtVariables): MutationRef<CreateThoughtData, CreateThoughtVariables>;
  operationName: string;
}
export const createThoughtRef: CreateThoughtRef;

export function createThought(vars: CreateThoughtVariables): MutationPromise<CreateThoughtData, CreateThoughtVariables>;
export function createThought(dc: DataConnect, vars: CreateThoughtVariables): MutationPromise<CreateThoughtData, CreateThoughtVariables>;

interface UpdateThoughtRef {
  /* Allow users to create refs without passing in DataConnect */
  (vars: UpdateThoughtVariables): MutationRef<UpdateThoughtData, UpdateThoughtVariables>;
  /* Allow users to pass in custom DataConnect instances */
  (dc: DataConnect, vars: UpdateThoughtVariables): MutationRef<UpdateThoughtData, UpdateThoughtVariables>;
  operationName: string;
}
export const updateThoughtRef: UpdateThoughtRef;

export function updateThought(vars: UpdateThoughtVariables): MutationPromise<UpdateThoughtData, UpdateThoughtVariables>;
export function updateThought(dc: DataConnect, vars: UpdateThoughtVariables): MutationPromise<UpdateThoughtData, UpdateThoughtVariables>;

interface DeleteThoughtRef {
  /* Allow users to create refs without passing in DataConnect */
  (vars: DeleteThoughtVariables): MutationRef<DeleteThoughtData, DeleteThoughtVariables>;
  /* Allow users to pass in custom DataConnect instances */
  (dc: DataConnect, vars: DeleteThoughtVariables): MutationRef<DeleteThoughtData, DeleteThoughtVariables>;
  operationName: string;
}
export const deleteThoughtRef: DeleteThoughtRef;

export function deleteThought(vars: DeleteThoughtVariables): MutationPromise<DeleteThoughtData, DeleteThoughtVariables>;
export function deleteThought(dc: DataConnect, vars: DeleteThoughtVariables): MutationPromise<DeleteThoughtData, DeleteThoughtVariables>;

interface ListUserThoughtsRef {
  /* Allow users to create refs without passing in DataConnect */
  (): QueryRef<ListUserThoughtsData, undefined>;
  /* Allow users to pass in custom DataConnect instances */
  (dc: DataConnect): QueryRef<ListUserThoughtsData, undefined>;
  operationName: string;
}
export const listUserThoughtsRef: ListUserThoughtsRef;

export function listUserThoughts(options?: ExecuteQueryOptions): QueryPromise<ListUserThoughtsData, undefined>;
export function listUserThoughts(dc: DataConnect, options?: ExecuteQueryOptions): QueryPromise<ListUserThoughtsData, undefined>;

