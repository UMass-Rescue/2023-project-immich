import type { LayoutServerLoad } from './$types';
export const ssr = false;

export const load = (async ({ locals: { user } }) => {
  return { user };
}) satisfies LayoutServerLoad;
