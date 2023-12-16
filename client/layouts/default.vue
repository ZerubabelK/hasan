<script setup>
import {
  Menu,
  MenuButton,
  MenuItems,
  MenuItem,
  TransitionChild,
  TransitionRoot,
  Dialog,
  DialogPanel,
} from "@headlessui/vue";
import { useUserStore } from "../store/userStore";
const userStore = useUserStore();
const router = useRouter();
const navigation = ref([
  { name: "Bookings", to: "/", icon: "tabler:brand-booking" },
  { name: "vehicles", to: "/vehicles", icon: "mdi:taxi" },
  { name: "staffs", to: "/staffs", icon: "clarity:employee-group-line" },
]);

const name = userStore.users.metadata.user_data.name;
const logout = () => {
  userStore.unset();
  router.push("/login");
};
const sidebarOpen = ref(false);
</script>
<template>
  <div>
    <TransitionRoot as="template" :show="sidebarOpen">
      <Dialog
        as="div"
        class="relative z-50 lg:hidden"
        @close="sidebarOpen = false"
      >
        <TransitionChild
          as="template"
          enter="transition-opacity ease-linear duration-300"
          enter-from="opacity-0"
          enter-to="opacity-100"
          leave="transition-opacity ease-linear duration-300"
          leave-from="opacity-100"
          leave-to="opacity-0"
        >
          <div class="fixed inset-0 bg-gray-900/80" />
        </TransitionChild>

        <div class="fixed inset-0 flex">
          <TransitionChild
            as="template"
            enter="transition ease-in-out duration-300 transform"
            enter-from="-translate-x-full"
            enter-to="translate-x-0"
            leave="transition ease-in-out duration-300 transform"
            leave-from="translate-x-0"
            leave-to="-translate-x-full"
          >
            <DialogPanel class="relative flex flex-1 w-full max-w-xs mr-16">
              <TransitionChild
                as="template"
                enter="ease-in-out duration-300"
                enter-from="opacity-0"
                enter-to="opacity-100"
                leave="ease-in-out duration-300"
                leave-from="opacity-100"
                leave-to="opacity-0"
              >
                <div
                  class="absolute top-0 flex justify-center w-16 pt-5 left-full"
                >
                  <button
                    type="button"
                    class="-m-2.5 p-2.5"
                    @click="sidebarOpen = false"
                  >
                    <span class="sr-only">Close sidebar</span>
                    <Icon
                      name="material-symbols:close"
                      class="text-white"
                    ></Icon>
                  </button>
                </div>
              </TransitionChild>
              <!-- Sidebar component, swap this element with another sidebar if you like -->
              <div
                class="flex flex-col px-6 pb-4 overflow-y-auto grow gap-y-5 bg-primary-light"
              >
                <div class="flex items-center h-16 space-x-4 shrink-0">
                  <img
                    class="w-auto h-14"
                    src="@/assets/images/logo.png"
                    alt="Your Company"
                  />
                  <p class="text-lg font-bold text-primary">TAXI</p>
                </div>
                <nav class="flex flex-col flex-1 pt-20 space-y-12">
                  <NuxtLink
                    exact-active-class="text-white rounded bg-primary"
                    v-for="nav in navigation"
                    :to="nav.to"
                    class="flex items-center p-2 space-x-2"
                    :key="nav.to"
                  >
                    <Icon :name="nav.icon" class="text-3xl"></Icon>
                    <p class="text-lg">{{ nav.name }}</p>
                  </NuxtLink>
                </nav>
              </div>
            </DialogPanel>
          </TransitionChild>
        </div>
      </Dialog>
    </TransitionRoot>

    <!-- Static sidebar for desktop -->
    <div
      class="hidden lg:fixed lg:inset-y-0 lg:z-50 lg:flex lg:w-72 lg:flex-col bg-primary2"
    >
      <!-- Sidebar component, swap this element with another sidebar if you like -->
      <div
        class="flex flex-col px-6 pb-4 overflow-y-auto border-r-2 grow gap-y-5 border-primary"
      >
        <div class="flex items-center h-16 space-x-6 shrink-0">
          <img
            class="w-auto h-20"
            src="@/assets/images/logo.png"
            alt="Your Company"
          />
        </div>
        <nav class="flex flex-col flex-1 pt-20 space-y-12">
          <NuxtLink
            exact-active-class="text-white rounded bg-primary"
            v-for="nav in navigation"
            :to="nav.to"
            class="flex items-center p-2 space-x-2"
          >
            <Icon :name="nav.icon" class="text-3xl"></Icon>
            <p class="text-lg">{{ nav.name }}</p>
          </NuxtLink>
        </nav>
      </div>
    </div>

    <div class="lg:pl-72">
      <div
        class="sticky top-0 z-40 flex items-center h-16 px-4 bg-white border-b border-gray-200 shadow-sm shrink-0 gap-x-4 sm:gap-x-6 sm:px-6 lg:px-8"
      >
        <button
          type="button"
          class="-m-2.5 p-2.5 text-gray-700 lg:hidden"
          @click="sidebarOpen = true"
        >
          <span class="sr-only">Open sidebar</span>
          <Icon name="ic:baseline-menu"></Icon>
        </button>

        <!-- Separator -->
        <div class="w-px h-6 bg-gray-900/10 lg:hidden" aria-hidden="true" />

        <div class="flex self-stretch flex-1 gap-x-4 lg:gap-x-6">
          <form class="relative flex flex-1" action="#" method="GET"></form>
          <div class="flex items-center gap-x-4 lg:gap-x-6">
            <!-- Separator -->
            <div
              class="hidden lg:block lg:h-6 lg:w-px lg:bg-gray-900/10"
              aria-hidden="true"
            />

            <!-- Profile dropdown -->
            <Menu as="div" class="relative">
              <MenuButton class="-m-1.5 flex items-center p-1.5">
                <span class="sr-only">Open user menu</span>
                <span class="hidden lg:flex lg:items-center">
                  <span
                    class="ml-4 text-sm font-semibold leading-6 text-gray-900"
                    aria-hidden="true"
                    >{{ name }}</span
                  >
                  <Icon name="mingcute:down-line"></Icon>
                </span>
              </MenuButton>
              <transition
                enter-active-class="transition duration-100 ease-out"
                enter-from-class="transform scale-95 opacity-0"
                enter-to-class="transform scale-100 opacity-100"
                leave-active-class="transition duration-75 ease-in"
                leave-from-class="transform scale-100 opacity-100"
                leave-to-class="transform scale-95 opacity-0"
              >
                <MenuItems
                  class="absolute right-0 z-10 mt-2.5 w-32 origin-top-right rounded-md bg-white py-2 shadow-lg ring-1 ring-gray-900/5 focus:outline-none"
                >
                  <MenuItem v-slot="{ active }">
                    <button
                      @click="logout"
                      :class="[
                        active ? 'bg-gray-50' : '',
                        'block px-3 py-1 text-sm leading-6 text-gray-900',
                      ]"
                    >
                      Logout
                    </button>
                  </MenuItem>
                </MenuItems>
              </transition>
            </Menu>
          </div>
        </div>
      </div>

      <main class="py-10">
        <slot />
      </main>
    </div>
  </div>
</template>
