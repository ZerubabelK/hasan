<script setup>
import get_booking from "../api/query/get_bookings.gql";
import list from "../composable/query/list";
import { Menu, MenuButton, MenuItems, MenuItem } from "@headlessui/vue";
import get_vehicle from "../api/query/get_vehicles_list.gql";
import get_driver from "../api/query/get_driver.gql";
import get_PA from "../api/query/get_PA.gql";
import mutator from "~/composable/mutator";
import assign_api from "../api/mutation/update_booking.gql";
definePageMeta({
  middleware: ["auth"],
});
const heads = ref([
  "Booking NO",
  "vehicles Reg NO",
  "Driver Name",
  "Driver Phone",
  "PA",
  "PA Phone",
  "Route",
  "Pickup Date",
  "1st Pickup Time",
  "1st Pickup address",
  "1st pupil name",
  "1st pupil phone",
  "2nd Pickup address",
  "2nd pupil name",
  "2nd pupil phone",
  "3rd Pickup address",
  "3rd pupil name",
  "3rd pupil phone",
  "4th Pickup address",
  "4th pupil name",
  "4th pupil phone",
  "5th Pickup address",
  "5th pupil name",
  "5th pupil phone",
  "6th Pickup address",
  "6th pupil name",
  "6th pupil phone",
  "7th Pickup address",
  "7th pupil name",
  "7th pupil phone",
  "8th Pickup address",
  "8th pupil name",
  "8th pupil phone",
  "1st Drop off",
  "2nd Drop off",
  "3rd Drop off",
  "4th Drop off",
  "5th Drop off",
  "6th Drop off",
  "7th Drop off",
  "8th Drop off",
  "status",
  "Action",
]);
const key = [
  "vehicle_reg",
  "driver_name",
  "driver_phone",
  "PA_name",
  "PA_phone",
  "route",
  "pickup_date",
  "first_pickup_time",
  "first_pickup_address",
  "first_pupil_name",
  "first_pupil_phone",
  "second_pickup_address",
  "second_pupil_name",
  "second_pupil_phone",
  "third_pickup_address",
  "third_pupil_name",
  "third_pupil_phone",
  "fourth_pickup_address",
  "fourth_pupil_name",
  "fourth_pupil_phone",
  "fifth_pickup_address",
  "fifth_pupil_name",
  "fifth_pupil_phone",
  "sixth_pickup_address",
  "sixth_pupil_name",
  "sixth_pupil_phone",
  "seventh_pickup_address",
  "seventh_pupil_name",
  "seventh_pupil_phone",
  "eighth_pickup_address",
  "eighth_pupil_name",
  "eighth_pupil_phone",
  "first_drop_off",
  "second_drop_off",
  "third_drop_off",
  "fourth_drop_off",
  "fifth_drop_off",
  "sixth_drop_off",
  "seventh_drop_off",
  "eighth_drop_off",
  "status",
];
const data = ref([
  // More people...
]);
const vehicle_reg = ref("");
const driver_name = ref("");
const PA_name = ref("");

const filter = computed(() => {});
const { onResult, onError, loading, refetch } = list(get_booking, { filter });
onResult((result) => {
  data.value = result.data.items;
});
const { onResult: vehicleResult } = list(get_vehicle, { filter });

const vehicle_items = ref([]);
vehicleResult((result) => {
  console.log(result.data);
  vehicle_items.value = result.data.items;
});
const driver_items = ref([]);
const { onResult: driverResult } = list(get_driver, { filter });

driverResult((result) => {
  console.log(result.data);
  driver_items.value = result.data.items;
});
const { onResult: PAResult } = list(get_PA, { filter });

const PA_items = ref([]);
PAResult((result) => {
  console.log(result.data);
  PA_items.value = result.data.items;
});

const openModal = ref(false);
const booking_id = ref("");
const item = ref({});
const assignModal = (idx) => {
  openModal.value = true;
  booking_id.value = idx;
};

const {
  mutate,
  onDone,
  onError: assignError,
  loading: assign_loading,
} = mutator(assign_api, {});
const router = useRouter();
onDone(() => {
  openModal.value = false;
  refetch();
});
const assign = () => {
  var vehicle_obj = vehicle_items.value.find(
    (obj) => obj.id === vehicle_reg.value
  );

  var driver_obj = driver_items.value.find(
    (obj) => obj.id === driver_name.value
  );
  var PA_obj = PA_items.value.find((obj) => obj.id === PA_name.value);
  const set = {
    vehicle_reg: vehicle_obj.name,
    driver_phone: driver_obj.phone_number,
    driver_name: driver_obj.name,
    PA_name: PA_obj.name,
    PA_phone: PA_obj.phone_number,
    status: "Assigned",
  };
  console.log(set);

  mutate({
    set: set,
    id: booking_id.value,
  });
};
</script>

<template>
  <Modal v-model="openModal" w>
    <template #ModalContent>
      <div class="flex justify-between">
        <span>Assign vehicle and PA </span>
        <Icon
          @click="openModal = false"
          class="text-lg cursor-pointer"
          name="material-symbols:close"
        ></Icon>
      </div>
      <div class="grid grid-cols-3 gap-4 py-24 pt-10">
        <div class="">
          <label
            for="name"
            class="block text-sm font-medium leading-6 capitalize text-primary-text"
            >vehicle registration</label
          >
          <ListSelect
            v-model="vehicle_reg"
            :items="vehicle_items"
            name="vehicle_reg"
            class="py-2"
          ></ListSelect>
        </div>

        <div class="">
          <label
            for="email"
            class="block text-sm font-medium leading-6 capitalize text-primary-text"
            >Driver Name
          </label>
          <div class="">
            <ListSelect
              v-model="driver_name"
              :items="driver_items"
              name="vehicle_reg"
              class="py-2"
            ></ListSelect>
          </div>
        </div>

        <div class="">
          <label
            for="email"
            class="block text-sm font-medium leading-6 capitalize text-primary-text"
            >PA Name
          </label>
          <div class="">
            <ListSelect
              v-model="PA_name"
              :items="PA_items"
              name="vehicle_reg"
              class="py-2"
            ></ListSelect>
          </div>
        </div>
      </div>
      <div class="flex items-center justify-center w-full">
        <button
          type="button"
          @click="assign"
          class="px-3 py-2 text-white rounded bg-primary"
        >
          <span v-if="!assign_loading">submit</span>
          <Icon
            v-else
            name="line-md:loading-twotone-loop"
            class="text-xl text-white"
          ></Icon>
        </button>
      </div>
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
          to="/add-booking"
          class="block px-3 py-2 text-sm font-semibold text-center border-2 rounded-md shadow-sm border-primary text-primary hover:bg-primary hover:text-white focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
        >
          Add booking
        </NuxtLink>
      </div>
    </div>
    <div class="flow-root mt-8">
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
                  class="py-3.5 min-w-[150px] text-left text-sm font-semibold text-gray-900"
                >
                  {{ head }}
                </th>

                <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-0">
                  <span class="sr-only">Edit</span>
                </th>
              </tr>
            </thead>
            <tbody class="divide-gray-200">
              <tr v-for="(item, index) in data">
                <td
                  class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-0 min-w-[100px]"
                >
                  {{ index + 1 }}
                </td>

                <td
                  v-for="value in key"
                  class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-0 min-w-[100px]"
                >
                  {{ item[value] }}
                </td>

                <td
                  class="relative py-4 pl-3 pr-4 text-sm font-medium text-left whitespace-nowrap sm:pr-0"
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
                          @click="assignModal(item.id)"
                          class="w-full px-2 py-2 hover:text-primary"
                          v-slot="{ active }"
                        >
                          <div
                            class="flex items-center space-x-4 border-b cursor-pointer"
                          >
                            <Icon
                              name="fluent-mdl2:assign"
                              class="text-2xl"
                            ></Icon>
                            <p>Assign staff</p>
                          </div>
                        </MenuItem>
                        <MenuItem
                          class="w-full px-2 py-2 hover:text-primary"
                          v-slot="{ active }"
                        >
                          <NuxtLink
                            :to="`/edit-booking/${item.id}`"
                            class="flex items-center space-x-4 border-b"
                          >
                            <Icon name="ri:edit-line" class="text-2xl"></Icon>
                            <p>Edit</p>
                          </NuxtLink>
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
