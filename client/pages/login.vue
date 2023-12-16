<script setup>
import mutator from "../composable/mutator";
import login from "../api/mutation/login.gql";
import { useUserStore } from "../store/userStore.js";
const userStore = useUserStore();
definePageMeta({
  layout: "login",
});
const custom_cookie = useCookie("custom_token");

const error = ref("");
const router = useRouter();
const email = ref("");
const password = ref("");
const { mutate, onDone, onError, loading } = mutator(login);
const insert = () => {
  if (!email.value || !password.value) {
    error.value = "Please fill all the fields";
    return;
  }

  mutate({
    data: {
      email: email.value,
      password: password.value,
    },
  });
};
onDone((result) => {
  if (result.data.login.token) {
    custom_cookie.value = "Bearer " + result.data.login;
    console.log(custom_cookie.value);
    userStore.set(result.data.login);

    router.push("/");
  }
});
</script>

<template>
  <body class="flex items-center justify-center w-screen h-screen">
    <!-- Right side with input fields -->
    <div class="flex-shrink-0 p-16 rounded-md shadow-md bg-primary-light">
      <h2 class="mb-4 text-2xl font-bold text-primary">Login</h2>
      <!-- Your login form goes here -->
      <form @submit.prevent="insert">
        <div class="mb-4">
          <p class="text-red-500">{{ error }}</p>
        </div>
        <div class="mb-4">
          <label
            class="block mb-2 text-sm font-bold text-gray-700"
            for="username"
          >
            Email
          </label>
          <input
            v-model="email"
            class="w-full px-3 py-2 border rounded-md focus:outline-none focus:shadow-outline min-w-[200px]"
            id="username"
            type="text"
            placeholder="Enter your email"
          />
        </div>

        <div class="mb-4">
          <label
            class="block mb-2 text-sm font-bold text-gray-700"
            for="password"
          >
            Password
          </label>
          <input
            v-model="password"
            class="w-full px-3 py-2 border rounded-md focus:outline-none focus:shadow-outline min-w-[200px]"
            id="password"
            type="password"
            placeholder="Enter your password"
          />
        </div>
        <div class="flex justify-center w-full">
          <button
            class="bg-primary text-white py-2 w-[70px] rounded-md focus:outline-none focus:shadow-outline"
          >
            <span v-if="!loading">Log In</span>
            <Icon
              v-else
              name="line-md:loading-twotone-loop"
              class="text-xl text-white"
            ></Icon>
          </button>
        </div>
      </form>
    </div>
  </body>
</template>
