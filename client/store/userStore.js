import { useStorage } from "@vueuse/core";
import { defineStore } from 'pinia'
// const router = useRouter()

export const useUserStore = defineStore("users_info", {
  state: () => ({
    users: useStorage("session", {}),
  }),
  persist: true,
  getters: {
    isLoggedIn: (state) => {
      return !!state.users?.token;
    },
    email: (state) => state.users?.email,
    name: (state) => state.users?.name,
    token: (state) => state.users?.token,
    phone_number: (state) => state.users?.phone_number,
  },
  actions: {
    unset() {
      localStorage.removeItem("session");
      this.users = {};
      // router.push({ name: "/" });
    },
    set(data) {
      //   console.log(data);
      let token = data.token;
      console.log(token);
      let session = token.split(".")[1];
      session = JSON.parse(window.atob(session));
      session.token = token;
      localStorage.setItem("session", JSON.stringify(session));
      console.log("useeeeelll",session.metadata.user_data);
      this.users = session;
      // console.log(this.users);
    },
   
  },
  
});
