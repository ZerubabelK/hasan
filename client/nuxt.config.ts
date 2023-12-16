// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  ssr: false,
  modules: [
    "@nuxtjs/tailwindcss",
    "nuxt-headlessui",
    "nuxt-icon",
    "@nuxtjs/apollo",
    "@vueuse/nuxt",
    "@pinia/nuxt",
    "nuxt-icon",
    "@pinia-plugin-persistedstate/nuxt",
  ],
  apollo: {
    clients: {
      default: {
        httpEndpoint: process.env.URL,
      },
    },
  },
  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },
  build: {
    transpile: ["graphql"],
  },
  css: [
    "~/assets/css/main.css",
    // "primevue/resources/themes/lara-light-blue/theme.css",
    // "primevue/resources/primevue.css",
  ],
});
