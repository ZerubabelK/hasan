<script setup>
import mutator from "../composable/mutator";
import insert_vehicle from "../api/mutation/insert_vehicle.gql";

const item = ref({});
const { mutate, onDone, onError } = mutator(insert_vehicle);
const insert = () => {
  mutate({
    item: item.value,
  });
};
</script>

<template>
  <form class="px-[3%] justify-center flex max-h-full gap-x-4">
    <div class="space-y-12 over">
      <!-- <textarea id="about" name="about" rows="3" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" /> -->
      <div class="border-b border-gray-900/10 pb-12 h-[85vh] pr-4">
        <div class="">
          <div class="space-y-4">
            <h2
              class="pt-20 text-base font-semibold leading-7 text-gray-900 capitalize"
            >
              vehicle Information
            </h2>
            <div class="grid grid-cols-1 gap-4 pt-10 sm:grid-cols-2">
              <div class="">
                <label
                  for="owner"
                  class="block text-sm font-medium leading-6 capitalize text-primary-text"
                  >vehicle owner</label
                >
                <div class="">
                  <input
                    v-model="item.owner"
                    id="owner"
                    name="owner"
                    type="owner"
                    autocomplete="owner"
                    placeholder="Owner"
                    class="block w-full rounded-md border-0 py-2.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 px-2 placeholder:text-gray-400 focus:ring-1 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                </div>
              </div>
              <div class="">
                <label
                  for="registration"
                  class="block text-sm font-medium leading-6 capitalize text-primary-text"
                  >vehicle registration</label
                >
                <div class="">
                  <input
                    v-model="item.vehicle_reg"
                    id="registration"
                    name="registration"
                    type="registration"
                    autocomplete="registration"
                    class="block w-full capitalize rounded-md border-0 py-2.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 px-2 placeholder:text-gray-400 focus:ring-1 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                </div>
              </div>
              <div class="">
                <label
                  for="MOT_exp"
                  class="block w-full px-1 text-sm font-medium text-primary-text"
                  >MOT Expiry Date</label
                >
                <input
                  v-model="item.MOT_exp"
                  type="date"
                  id="MOT_exp"
                  name="MOT_exp"
                  class="w-full p-2 border rounded-md focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
              <div class="">
                <label
                  for="taxi_plate_exp"
                  class="block w-full px-1 text-sm font-medium text-primary-text"
                  >Taxi Plate Expiry Date</label
                >
                <input
                  v-model="item.taxi_plate_exp"
                  type="date"
                  id="taxi_plate_exp"
                  name="taxi_plate_exp"
                  class="w-full p-2 border rounded-md focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
              <div class="">
                <label
                  for="insurance_exp"
                  class="block w-full px-1 text-sm font-medium text-primary-text"
                  >Insurance Expiry Date</label
                >
                <input
                  v-model="item.insurance_exp"
                  type="date"
                  id="insurance_exp"
                  name="insurance_exp"
                  class="w-full p-2 border rounded-md focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
              <div class="">
                <label
                  for="council_inspection_exp"
                  class="block w-full px-1 text-sm font-medium text-primary-text"
                  >Insurance Expiry Date</label
                >
                <input
                  v-model="item.council_inspection_exp"
                  type="date"
                  id="council_inspection_exp"
                  name="council_inspection_exp"
                  class="w-full p-2 border rounded-md focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
            </div>

            <div class="flex justify-center w-full">
              <button
                type="button"
                @click="insert"
                class="px-2 py-1 text-white rounded bg-primary"
              >
                Submit
              </button>
            </div>
          </div>
        </div>
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
