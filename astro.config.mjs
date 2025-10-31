// @ts-check
import { defineConfig } from 'astro/config';
import netlify from '@astrojs/netlify';
import mdx from '@astrojs/mdx';
import icon from 'astro-icon';

// https://astro.build/config
export default defineConfig({
  // Site URL - Step 13 or deployment will customize this
  site: 'https://yoursite.com',

  // Static by default (change to 'server' or 'hybrid' for SSR if needed)
  output: 'static',

  // Netlify adapter with optimizations (only used if output is 'server' or 'hybrid')
  adapter: netlify({
    edgeMiddleware: true,
    imageCDN: true, // Use Netlify Image CDN for automatic optimization
  }),

  // Integrations
  integrations: [
    mdx(),
    icon({
      include: {
        lucide: ['*'], // Include all Lucide icons (default icon set)
      },
    }),
  ],

  // Image optimization
  image: {
    domains: [], // Step 13 will add domains from downloaded assets
  },

  // Prefetch for faster navigation
  prefetch: {
    prefetchAll: true,
    defaultStrategy: 'hover',
  },

  // Build optimizations
  build: {
    inlineStylesheets: 'auto',
  },

  // Security headers configured in netlify.toml
});
