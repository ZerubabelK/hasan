import { useUserStore } from "@/store/userStore";
export default defineNuxtRouteMiddleware((to, from, next) => {
  const user = useUserStore();
  // if (process.server) return
  if (user.isLoggedIn) {
    console.log("user is logged in");
    return;
  } else {
  
    return navigateTo("/login");
  }
});
