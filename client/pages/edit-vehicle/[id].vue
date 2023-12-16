<script setup>
import mutator from "../composable/mutator";
import update_vehicle from "../api/mutation/update_vehicle.gql";
import get_vehicle from "../api/query/get_vehicle.gql";
import list from "../composable/query/get_one";
const route = useRoute();
const id = ref(route.params.id);
const item = ref({});
const { mutate, onDone, onError,loading } = mutator(update_vehicle);
const update = () => {
  delete item.value.__typename;

  mutate({
    set: item.value,
    id:id.value
  });
};

const {
  onError: onOneError,
  onResult,
  loading: oneLoading,
} = list(get_vehicle, id);
onResult((result) => {
  item.value = { ...result.data.items };
});
const router = useRouter();
onDone(() => {
  router.push("/vehicles");
});

</script>

<template>
  <form class="px-[3%] justify-center flex max-h-full space-x-4">
    <div class="space-y-12 over">
      <!-- <textarea id="about" name="about" rows="3" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" /> -->
      <div class="border-b border-gray-900/10 pb-12 h-[85vh] pr-4">
        <div class="">
          <div class="space-y-4">
            <h2
              class="text-base font-semibold leading-7 pt-20 text-gray-900 capitalize"
            >
              vehicle Information
            </h2>
            <div class="grid grid-cols-2 gap-4 pt-10">
              <div class="">
                <label
                  for="owner"
                  class="block text-sm capitalize font-medium leading-6 text-primary-text"
                  >vehicle owner</label
                >
                <div class="">
                  <input
                    v-model="item.owner"
                    id="owner"
                    name="owner"
                    type="owner"
                    autocomplete="owner"
                    class="block w-full rounded-md border-0 py-2.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 px-2 placeholder:text-gray-400 focus:ring-1 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                </div>
              </div>
              <div class="">
                <label
                  for="registration"
                  class="block text-sm capitalize font-medium leading-6 text-primary-text"
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
                  class="block text-sm w-full font-medium px-1 text-primary-text"
                  >MOT Expiry Date</label
                >
                <input
                  v-model="item.MOT_exp"
                  type="date"
                  id="MOT_exp"
                  name="MOT_exp"
                  class="p-2 border rounded-md w-[300px] focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
              <div class="">
                <label
                  for="taxi_plate_exp"
                  class="block text-sm w-full font-medium px-1 text-primary-text"
                  >Taxi Plate Expiry Date</label
                >
                <input
                  v-model="item.taxi_plate_exp"
                  type="date"
                  id="taxi_plate_exp"
                  name="taxi_plate_exp"
                  class="p-2 border rounded-md w-[300px] focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
              <div class="">
                <label
                  for="insurance_exp"
                  class="block text-sm w-full font-medium px-1 text-primary-text"
                  >Insurance Expiry Date</label
                >
                <input
                  v-model="item.insurance_exp"
                  type="date"
                  id="insurance_exp"
                  name="insurance_exp"
                  class="p-2 border rounded-md w-[300px] focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
              <div class="">
                <label
                  for="council_inspection_exp"
                  class="block text-sm w-full font-medium px-1 text-primary-text"
                  >Insurance Expiry Date</label
                >
                <input
                  v-model="item.council_inspection_exp"
                  type="date"
                  id="council_inspection_exp"
                  name="council_inspection_exp"
                  class="p-2 border rounded-md w-[300px] focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
            </div>

            <div class="w-full flex justify-center">
              <button
                type="button"
                @click="update"
                class="text-white bg-primary px-2 py-1 rounded"
              >
              <span v-if="!loading">update</span>
                <Icon
                  v-else
                  name="line-md:loading-twotone-loop"
                  class="text-white text-2xl"
                ></Icon>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>
  <!-- 
    <div
   class="mt-2 flex justify-center rounded-lg border border-dashed border-gray-900/25 px-6 py-10"
  >
  <div class="text-center">
    <Icon name="ph:image-thin"></Icon>
    <div class="mt-4 flex text-sm leading-6 text-gray-600">
      <label
        for="file-upload"
        class="relative cursor-pointer rounded-md bg-white font-semibold text-indigo-600 focus-within:outline-none focus-within:ring-2 focus-within:ring-indigo-600 focus-within:ring-offset-2 hover:text-indigo-500"
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
