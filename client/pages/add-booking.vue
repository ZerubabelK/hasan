<script setup>
import insert_booking from "../api/mutation/insert_booking.gql";
import mutator from "../composable/mutator";

const current = 1;
const option = ref({});
const options = ref([]);
const add = () => {
  options.value.push(option.value);
  option.value = {};
};
var number = [
  "first_",
  "second_",
  "third_",
  "fourth_",
  "fifth_",
  "sixth_",
  "seventh_",
  "eighth_",
];
var optionName = ["pickup_address", "pupil_name", "pupil_phone", "drop_off"];
const item = ref({});
const { mutate, onDone, onError, loading } = mutator(insert_booking);
const insert = () => {
  options.value.forEach((element, idx) => {
    item.value[number[idx] + optionName[0]] = element.pickup_address;
    item.value[number[idx] + optionName[1]] = element.pupil_name;
    item.value[number[idx] + optionName[2]] = element.pupil_phone;
    item.value[number[idx] + optionName[3]] = element.drop_off;
  });

  console.log(item);

  mutate({
    data: item.value,
  });
};
const remove = (idx) => {
  options.value = options.value.filter((value, index) => index != idx);
};
const router = useRouter();
onDone(() => {
  router.push("/");
});
</script>

<template>
  <form class="px-[3%] lg:grid grid-cols-2 max-h-full lg:space-x-4">
    <div class="w-full space-y-12 over">
      <!-- <textarea id="about" name="about" rows="3" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" /> -->
      <div
        class="border-b md:border-gray-900/10 pb-12 w-full md:border-r min-h-[85vh] pr-4"
      >
        <h2 class="text-base font-semibold leading-7 text-gray-900">
          Booking Information
        </h2>

        <div class="pt-6">
          <div class="grid grid-cols-1 gap-4 lg:grid-cols-2">
            <div class="">
              <label
                for="route"
                class="block text-sm font-medium leading-6 text-primary-text"
                >Route</label
              >
              <div class="">
                <input
                  v-model="item.route"
                  id="route"
                  name="route"
                  type="text"
                  placeholder="Route"
                  class="block w-full rounded-md border-0 py-2.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 px-2 placeholder:text-gray-400 focus:ring-1 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                />
              </div>
            </div>
            <div class="">
              <label
                for="Pickup date"
                class="block w-full px-1 text-sm font-medium text-primary-text"
                >Pickup date</label
              >
              <input
                v-model="item.pickup_date"
                type="date"
                id="Pickup date"
                name="Pickup date"
                class="w-full p-2 border rounded-md focus:outline-none focus:ring focus:border-blue-300"
              />
            </div>
            <div class="">
              <label
                for="datepicker"
                class="block px-1 text-sm font-medium text-primary-text"
                >First Pickup time</label
              >
              <input
                v-model="item.first_pickup_time"
                type="time"
                id="datepicker"
                name="timepicker"
                class="w-full p-2 border rounded-md focus:outline-none focus:ring focus:border-blue-300"
              />
            </div>
          </div>

          <div>
            <h2
              class="pt-20 text-base font-semibold leading-7 text-gray-900 capitalize"
            >
              Route Information
            </h2>
            <div class="grid-cols-2 gap-10 md:grid">
              <div class="">
                <label
                  for="address"
                  class="block text-sm font-medium leading-6 capitalize text-primary-text"
                  >pickup address</label
                >
                <div class="">
                  <input
                    v-model="option.pickup_address"
                    id="address"
                    name="address"
                    type="text"
                    placeholder="Address"
                    class="block w-full rounded-md border-0 py-2.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 px-2 placeholder:text-gray-400 focus:ring-1 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                </div>
              </div>
              <div class="">
                <label
                  for="pupil_name"
                  class="block text-sm font-medium leading-6 capitalize text-primary-text"
                  >pupil name</label
                >
                <div class="">
                  <input
                    v-model="option.pupil_name"
                    id="pupil_name"
                    name="pupil_name"
                    type="text"
                    placeholder="Name"
                    class="block w-full capitalize rounded-md border-0 py-2.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 px-2 placeholder:text-gray-400 focus:ring-1 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                </div>
              </div>
              <div class="">
                <label
                  for="pupil_phone"
                  class="block text-sm font-medium leading-6 capitalize text-primary-text"
                  >pupil phone</label
                >
                <div class="">
                  <input
                    v-model="option.pupil_phone"
                    id="pupil_phone"
                    name="pupil_phone"
                    type="text"
                    placeholder="Phone"
                    class="block w-full rounded-md border-0 py-2.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 px-2 placeholder:text-gray-400 focus:ring-1 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                </div>
              </div>
              <div class="">
                <label
                  for="drop"
                  class="block text-sm font-medium leading-6 capitalize text-primary-text"
                  >drop off</label
                >
                <div class="">
                  <input
                    id="drop"
                    v-model="option.drop_off"
                    name="drop"
                    type="text"
                    placeholder="Address"
                    autocomplete="address"
                    class="block w-full rounded-md border-0 py-2.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 px-2 placeholder:text-gray-400 focus:ring-1 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                </div>
              </div>
              <div class="flex justify-center w-full col-span-2 text-white">
                <button
                  :disabled="options.length == 8"
                  type="button"
                  @click="add"
                  class="p-2 px-4 mt-3 rounded-md bg-primary"
                >
                  add route
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="w-full">
      <p class="text-lg">Preview</p>
      <div class="grid w-full grid-cols-2 gap-4">
        <div><span class="text-gray-500">Route:</span> {{ item.route }}</div>
        <div>
          <span class="text-gray-500">Pickup date:</span> {{ item.pickup_date }}
        </div>
        <div>
          <span class="text-gray-500">First pickup time:</span>
          {{ item.first_pickup_time }}
        </div>
      </div>
      <p class="pt-10 pb-3">Route Information</p>
      <div class="overflow-x-auto">
        <table class="min-w-full divide-y max-w-screen">
          <thead>
            <tr>
              <th
                scope="col"
                class="px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase bg-gray-50"
              >
                Order
              </th>
              <th
                scope="col"
                class="px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase bg-gray-50"
              >
                Pickup Address
              </th>
              <th
                scope="col"
                class="px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase bg-gray-50"
              >
                Pupil Name
              </th>
              <th
                scope="col"
                class="px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase bg-gray-50"
              >
                Pupil Phone
              </th>
              <th
                scope="col"
                class="px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase bg-gray-50"
              >
                Drop Off
              </th>
              <th
                scope="col"
                class="px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase bg-gray-50"
              >
                action
              </th>
            </tr>
            <tr v-for="(option, index) in options">
              <td class="px-6 py-4 whitespace-nowrap">{{ index + 1 }}</td>
              <td class="px-6 py-4 whitespace-nowrap">
                {{ option.pickup_address }}
              </td>

              <td class="px-6 py-4 whitespace-nowrap">
                {{ option.pupil_name }}
              </td>
              <td class="px-6 py-4 whitespace-nowrap">
                {{ option.pupil_phone }}
              </td>
              <td class="px-6 py-4 whitespace-nowrap">{{ option.drop_off }}</td>
              <td>
                <Icon
                  @click="remove(index)"
                  name="material-symbols:delete-outline"
                ></Icon>
              </td>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            <!-- Add your table rows here -->
          </tbody>
        </table>
      </div>
      <div class="flex justify-center w-full pt-4 text-white">
        <button
          type="button"
          @click="insert"
          class="p-2 px-4 rounded-md bg-primary"
        >
          <span v-if="!loading">submit</span>
          <Icon
            v-else
            name="line-md:loading-twotone-loop"
            class="text-xl text-white"
          ></Icon>
        </button>
      </div>
    </div>
  </form>
  <!-- 
  <div
 class="flex justify-center px-6 py-10 mt-2 border border-dashed rounded-lg border-gray-900/25"
>
<div class="text-center">
  <Icon name="ph:image-thin"></Icon>
  <div class="flex mt-4 text-sm leading-6 text-gray-600">
    <label
      for="file-upload"
      class="relative font-semibold text-indigo-600 bg-white rounded-md cursor-pointer focus-within:outline-none focus-within:ring-2 focus-within:ring-indigo-600 focus-within:ring-offset-2 hover:text-indigo-500"
    >
      <span>Upload a file</span>
      <input
        id="file-upload"
        name="file-upload"
        type="file"
        class="sr-only"
      />
    </label>
    <p class="pl-1">or drag and drop</p>
  </div>
  <p class="text-xs leading-5 text-gray-600">
    PNG, JPG, GIF up to 10MB
  </p>
</div>
</div> -->
</template>
