/* tslint:disable */
/* eslint-disable */
/**
 * Immich
 * Immich API
 *
 * The version of the OpenAPI document: 1.94.1
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

import { exists, mapValues } from '../runtime';
import type { UserAvatarColor } from './UserAvatarColor';
import {
    UserAvatarColorFromJSON,
    UserAvatarColorFromJSONTyped,
    UserAvatarColorToJSON,
} from './UserAvatarColor';

/**
 * 
 * @export
 * @interface UpdateUserDto
 */
export interface UpdateUserDto {
    /**
     * 
     * @type {UserAvatarColor}
     * @memberof UpdateUserDto
     */
    avatarColor?: UserAvatarColor;
    /**
     * 
     * @type {string}
     * @memberof UpdateUserDto
     */
    email?: string;
    /**
     * 
     * @type {string}
     * @memberof UpdateUserDto
     */
    externalPath?: string;
    /**
     * 
     * @type {string}
     * @memberof UpdateUserDto
     */
    id: string;
    /**
     * 
     * @type {boolean}
     * @memberof UpdateUserDto
     */
    isAdmin?: boolean;
    /**
     * 
     * @type {boolean}
     * @memberof UpdateUserDto
     */
    memoriesEnabled?: boolean;
    /**
     * 
     * @type {string}
     * @memberof UpdateUserDto
     */
    name?: string;
    /**
     * 
     * @type {string}
     * @memberof UpdateUserDto
     */
    password?: string;
    /**
     * 
     * @type {number}
     * @memberof UpdateUserDto
     */
    quotaSizeInBytes?: number | null;
    /**
     * 
     * @type {boolean}
     * @memberof UpdateUserDto
     */
    shouldChangePassword?: boolean;
    /**
     * 
     * @type {string}
     * @memberof UpdateUserDto
     */
    storageLabel?: string;
}

/**
 * Check if a given object implements the UpdateUserDto interface.
 */
export function instanceOfUpdateUserDto(value: object): boolean {
    let isInstance = true;
    isInstance = isInstance && "id" in value;

    return isInstance;
}

export function UpdateUserDtoFromJSON(json: any): UpdateUserDto {
    return UpdateUserDtoFromJSONTyped(json, false);
}

export function UpdateUserDtoFromJSONTyped(json: any, ignoreDiscriminator: boolean): UpdateUserDto {
    if ((json === undefined) || (json === null)) {
        return json;
    }
    return {
        
        'avatarColor': !exists(json, 'avatarColor') ? undefined : UserAvatarColorFromJSON(json['avatarColor']),
        'email': !exists(json, 'email') ? undefined : json['email'],
        'externalPath': !exists(json, 'externalPath') ? undefined : json['externalPath'],
        'id': json['id'],
        'isAdmin': !exists(json, 'isAdmin') ? undefined : json['isAdmin'],
        'memoriesEnabled': !exists(json, 'memoriesEnabled') ? undefined : json['memoriesEnabled'],
        'name': !exists(json, 'name') ? undefined : json['name'],
        'password': !exists(json, 'password') ? undefined : json['password'],
        'quotaSizeInBytes': !exists(json, 'quotaSizeInBytes') ? undefined : json['quotaSizeInBytes'],
        'shouldChangePassword': !exists(json, 'shouldChangePassword') ? undefined : json['shouldChangePassword'],
        'storageLabel': !exists(json, 'storageLabel') ? undefined : json['storageLabel'],
    };
}

export function UpdateUserDtoToJSON(value?: UpdateUserDto | null): any {
    if (value === undefined) {
        return undefined;
    }
    if (value === null) {
        return null;
    }
    return {
        
        'avatarColor': UserAvatarColorToJSON(value.avatarColor),
        'email': value.email,
        'externalPath': value.externalPath,
        'id': value.id,
        'isAdmin': value.isAdmin,
        'memoriesEnabled': value.memoriesEnabled,
        'name': value.name,
        'password': value.password,
        'quotaSizeInBytes': value.quotaSizeInBytes,
        'shouldChangePassword': value.shouldChangePassword,
        'storageLabel': value.storageLabel,
    };
}

