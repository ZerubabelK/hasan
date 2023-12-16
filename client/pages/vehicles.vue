<script setup>
import mutator from "../composable/mutator";
import insert_staff from "../api/mutation/update_vehicle.gql";
import { Menu, MenuButton, MenuItems, MenuItem } from "@headlessui/vue";
import list from "../composable/query/list";
import get_vehicle from "../api/query/get_vehicles.gql";
import { format, parseISO, differenceInDays } from "date-fns";

const filter = computed(() => {});
const { loading, onResult, refetch } = list(get_vehicle, { filter });
const data = ref([]);
onResult((result) => {
  console.log(result.data);
  data.value = result.data.items;
});

const heads = ref([
  "Vehicle owner",
  "Vehicle Registration",
  "MOT Expiry Date",
  "Taxi Plate Expiry Date",
  "Insurance Expiry Date",
  "Document",
  "Status",
  "Action",
]);
const check_exp = (given) => {
  const currentDate = new Date();
  const parsedTimestamp = parseISO(given);
  return differenceInDays(parsedTimestamp, currentDate) > 0
    ? differenceInDays(parsedTimestamp, currentDate)
    : 0;
};
const isModalOpen = ref(false);
const pdf = ref("");
const preview = (value) => {
  if (value.length >3) {
    pdf.value = value;
    isModalOpen.value = true;
  }
};

const activate = (value) => {
  mutate({
    set: {
      status: "Active",
    },
    id: value,
  });
};
const { mutate, onDone, onError } = mutator(insert_staff);
onDone(() => {
  refetch();
});
</script>

<template>
  <Modal
    wrapper-class="relative flex items-start justify-start pb-4 space-y-2 bg-white rounded-lg !bg-transparent"
    :model-value="isModalOpen"
    @update:model-value="isModalOpen = true"
  >
    <template #ModalContent>
      <embed
        :src="pdf"
        class="xl:w-[800px] md:w-[400px] sm:w-[300px] w-[90vw] lg:h-[90vh] md:h-[80vh] sm:h-[70vh] h-[90vh]"
      />

      <Icon
        @click="isModalOpen = !isModalOpen"
        name="eva:close-fill"
        class="absolute top-0 right-0 items-center justify-center w-8 h-8 p-1 text-xl text-black bg-white rounded-full cursor-pointer aspect-square hover:bg-gray-100"
      />
    </template>
  </Modal>
  <div class="px-4 sm:px-6 lg:px-8 sideSpace">
    <div class="sm:flex sm:items-center">
      <div class="sm:flex-auto">
        <input
          type="text"
          placeholder="Search"
          class="px-4 py-2 text-sm w-[200px] border-primary border-1 ring-primary"
        />
      </div>
      <div class="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
        <NuxtLink
          to="/add-vehicle"
          class="block rounded-md border-2 border-primary px-3 py-2 text-center text-sm font-semibold text-primary shadow-sm hover:bg-primary hover:text-white focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
        >
          Add vehicles
        </NuxtLink>
      </div>
    </div>
    <div class="mt-8 flow-root">
      <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div
          class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8 min-h-[75vh]"
        >
          <table class="min-w-full divide-y divide-gray-300">
            <thead>
              <tr class="">
                <th
                  v-for="head in heads"
                  :key="head"
                  scope="col"
                  class="py-3.5 min-w-[70px] text-left text-sm font-semibold text-gray-900"
                >
                  {{ head }}
                </th>

                <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-0">
                  <span class="sr-only">Edit</span>
                </th>
              </tr>
            </thead>
            <tbody v-if="!loading" class="divide-gray-200">
              <tr v-for="object in data">
                <td
                  class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-0 min-w-[100px]"
                >
                  {{ object.owner }}
                </td>
                <td
                  class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-0 min-w-[100px]"
                >
                  {{ object.vehicle_reg }}
                </td>
                <td
                  class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-white sm:pl-0 min-w-[100px]"
                  :class="
                    check_exp(object.MOT_exp) <= 0
                      ? 'bg-red-300 text-white'
                      : check_exp(object.MOT_exp) <= 8
                      ? 'bg-yellow-300 text-white'
                      : 'bg-green-300'
                  "
                >
                  {{ object.MOT_exp }}
                </td>
                <td
                  class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-0 min-w-[100px]"
                  :class="
                    check_exp(object.taxi_plate_exp) <= 0
                      ? 'bg-red-300 text-white'
                      : check_exp(object.MOT_exp) <= 8
                      ? 'bg-yellow-300 text-white'
                      : 'bg-green-300'
                  "
                >
                  {{ object.taxi_plate_exp }}
                </td>
                <td
                  class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-0 min-w-[100px]"
                  :class="
                    check_exp(object.insurance_exp) <= 0
                      ? 'bg-red-300 text-white'
                      : check_exp(object.MOT_exp) <= 8
                      ? 'bg-yellow-300 text-white'
                      : 'bg-green-300'
                  "
                >
                  {{ object.insurance_exp }}
                </td>
                <td>
                  <button @click="preview(object.document_url)">preview</button>
                </td>

                <td
                  class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-0 min-w-[100px]"
                >
                  {{ object.status }}
                </td>

                <td
                  class="relative whitespace-nowrap py-4 pl-3 pr-4 text-left text-sm font-medium sm:pr-0"
                >
                  <Menu
                    as="div"
                    class="relative inline-block space-x-1 text-left"
                  >
                    <MenuButton
                      class="flex items-center justify-end p-1 space-x-2 rounded-full"
                    >
                      <div class="items-center hidden px-2 space-x-2 lg:flex">
                        <Icon
                          name="vaadin:ellipsis-dots-v"
                          class="text-lg"
                        ></Icon>
                      </div>
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
                        class="absolute bg-white shadow-sm border-2 min-w-[300px] rounded-md text-base z-50 w-full right-0"
                      >
                        <MenuItem
                          class="w-full px-2 py-2 hover:text-primary"
                          v-slot="{ active }"
                        >
                          <NuxtLink
                            :to="`/edit-vehicle/${object.id}`"
                            class="flex items-center cursor-pointer space-x-4 border-b"
                          >
                            <Icon name="ri:edit-line" class="text-2xl"></Icon>
                            <p>Edit</p>
                          </NuxtLink>
                        </MenuItem>
                        <MenuItem
                          @click="activate(object.id)"
                          class="w-full px-2 py-2 hover:text-primary"
                          v-slot="{ active }"
                        >
                          <div
                            class="flex items-center cursor-pointer space-x-4 border-b"
                          >
                            <Icon
                              name="fontisto:checkbox-active"
                              class="text-2xl"
                            ></Icon>
                            <p>Activate</p>
                          </div>
                        </MenuItem>
                      </MenuItems>
                    </transition>
                  </Menu>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<style>
th,
td {
  border: 1px solid black;
  @apply text-center;
}
</style>
