<script setup>
import { format, parse } from "date-fns";
import mutator from "../composable/mutator";
import get_booking from "../api/query/get_booking.gql";
import list from "../composable/query/get_one";
import update_booking_api from "../api/mutation/update_booking.gql";

const heads = ref([
  "1st Pickup address",
  "1st pupil name",
  "1st pupil phone",
  "1st Drop off",
  "2nd Pickup address",
  "2nd pupil name",
  "2nd pupil phone",
  "2nd Drop off",
  "3rd Pickup address",
  "3rd pupil name",
  "3rd pupil phone",
  "3rd Drop off",
  "4th Pickup address",
  "4th pupil name",
  "4th pupil phone",
  "4th Drop off",
  "5th Pickup address",
  "5th pupil name",
  "5th pupil phone",
  "5th Drop off",
  "6th Pickup address",
  "6th pupil name",
  "6th pupil phone",
  "6th Drop off",
  "7th Pickup address",
  "7th pupil name",
  "7th pupil phone",
  "7th Drop off",
  "8th Pickup address",
  "8th pupil name",
  "8th pupil phone",
  "8th Drop off",
]);
const key = [
  "first_pickup_address",
  "first_pupil_name",
  "first_pupil_phone",
  "first_drop_off",
  "second_pickup_address",
  "second_pupil_name",
  "second_pupil_phone",
  "second_drop_off",
  "third_pickup_address",
  "third_pupil_name",
  "third_pupil_phone",
  "third_drop_off",
  "fourth_pickup_address",
  "fourth_pupil_name",
  "fourth_pupil_phone",
  "fourth_drop_off",
  "fifth_pickup_address",
  "fifth_pupil_name",
  "fifth_pupil_phone",
  "fifth_drop_off",
  "sixth_pickup_address",
  "sixth_pupil_name",
  "sixth_pupil_phone",
  "sixth_drop_off",
  "seventh_pickup_address",
  "seventh_pupil_name",
  "seventh_pupil_phone",
  "seventh_drop_off",
  "eighth_pickup_address",
  "eighth_pupil_name",
  "eighth_pupil_phone",
  "eighth_drop_off",
];

const option = ref({});
const options = ref([]);
const route = useRoute();
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
const item = ref({});
const { mutate, onDone, onError, loading } = mutator(update_booking_api);
const id = ref(route.params.id);
const {
  onError: onOneError,
  onResult,
  loading: oneLoading,
} = list(get_booking, id);
onResult((result) => {
  item.value = { ...result.data.item };
  console.log(item.value.first_pickup_time);

  const parsedDate = parse("10:22:00+00", "HH:mm:ssX", new Date());

  item.value.first_pickup_time = format(parsedDate, "HH:mm:ss");
});
const update = () => {
  delete item.value.__typename
  mutate({
    set: item.value,
    id:id.value
  });
};

const router = useRouter();
onDone(() => {
  router.push("/");
});
</script>

<template>
  <form class="flex max-h-full justify-center space-x-4 mx-auto">
    <div class="space-y-12">
      <!-- <textarea id="about" name="about" rows="3" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" /> -->
      <div class="border-b border-gray-900/10 pb-12 w-full border-r pr-4">
        <h2 class="text-base font-semibold leading-7 text-gray-900">
          Booking Information
        </h2>

        <div class="pt-6">
          <div class="grid grid-cols-3 gap-4">
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
                  class="block w-[300px] rounded-md border-0 py-2.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 px-2 placeholder:text-gray-400 focus:ring-1 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                />
              </div>
            </div>
            <div class="">
              <label
                for="Pickup date"
                class="block text-sm w-full font-medium px-1 text-primary-text"
                >Pickup date</label
              >
              <input
                v-model="item.pickup_date"
                type="date"
                id="Pickup date"
                name="Pickup date"
                class="p-2 border rounded-md w-[300px] focus:outline-none focus:ring focus:border-blue-300"
              />
            </div>
            <div class="">
              <label
                for="datepicker"
                class="block text-sm font-medium px-1 text-primary-text"
                >First Pickup time {{ item.first_pickup_time }}</label
              >
              <input
                v-model="item.first_pickup_time"
                type="time"
                id="datepicker"
                name="timepicker"
                class="p-2 border rounded-md w-[300px] focus:outline-none focus:ring focus:border-blue-300"
              />
            </div>
          </div>

          <div>
            <h2
              class="text-base font-semibold leading-7 pt-20 text-gray-900 capitalize"
            >
              Route Information
            </h2>
            <div class="grid grid-cols-4 gap-10">
              <div v-for="(value, index) in key" class="">
                <label
                  for="address"
                  class="block text-sm capitalize font-medium leading-6 text-primary-text"
                  >{{ heads[index] }}</label
                >
                <div class="">
                  <input
                    v-model="item[value]"
                    id="address"
                    name="address"
                    type="text"
                    class="block w-full rounded-md border-0 py-2.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 px-2 placeholder:text-gray-400 focus:ring-1 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                </div>
              </div>

              <div class="col-span-4 w-full flex justify-center text-white">
                <button
                  :disabled="options.length == 8"
                  type="button"
                  @click="update"
                  class="p-2 px-4 w-20 bg-primary rounded-md"
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
    </div>
  </form>
</template>
