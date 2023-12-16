<script setup>
import mutator from "../composable/mutator";
import insert_staff from "../api/mutation/update_staff.gql";
import get_staff from "../api/query/get_staff.gql";
import list from "../composable/query/get_one";
const item = ref({});
const route = useRoute();
const id = ref(route.params.id);

const { mutate, onDone, onError } = mutator(insert_staff);
const update = () => {
  delete item.value.__typename;

  mutate({
    set: item.value,
    id: id.value,
  });
};
const {
  onError: onOneError,
  onResult,
  loading: oneLoading,
} = list(get_staff, id);
onResult((result) => {
  item.value = { ...result.data.items };
});
const pdf = ref("")
const router = useRouter();
onDone(() => {
  router.push("/staffs");
});
const isModalOpen = ref(false)
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
              Staff Information
            </h2>
            <div class="grid grid-cols-3 gap-4 pt-10">
              <div class="">
                <label
                  for="name"
                  class="block text-sm capitalize font-medium leading-6 text-primary-text"
                  >Name</label
                >
                <div class="">
                  <input
                    v-model="item.name"
                    id="name"
                    name="name"
                    type="name"
                    autocomplete="name"
                    class="block w-full rounded-md border-0 py-2.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 px-2 placeholder:text-gray-400 focus:ring-1 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                </div>
              </div>
              <div class="">
                <label
                  for="name"
                  class="block text-sm capitalize font-medium leading-6 text-primary-text"
                  >Staff Id</label
                >
                <div class="">
                  <input
                    v-model="item.staff_id"
                    id="id"
                    name="id"
                    type="text"
                    autocomplete="name"
                    class="block w-full rounded-md border-0 py-2.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 px-2 placeholder:text-gray-400 focus:ring-1 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                </div>
              </div>
              <div class="">
                <label
                  for="email"
                  class="block text-sm capitalize font-medium leading-6 text-primary-text"
                  >Address</label
                >
                <div class="">
                  <input
                    v-model="item.address"
                    id="email"
                    name="email"
                    type="email"
                    autocomplete="email"
                    class="block w-full capitalize rounded-md border-0 py-2.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 px-2 placeholder:text-gray-400 focus:ring-1 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                </div>
              </div>
              <div class="">
                <label
                  for="phone_number"
                  class="block text-sm capitalize font-medium leading-6 text-primary-text"
                  >Phone number</label
                >
                <div class="">
                  <input
                    v-model="item.phone_number"
                    id="phone_number"
                    name="phone_number"
                    type="text"
                    autocomplete="phone_number"
                    class="block w-full capitalize rounded-md border-0 py-2.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 px-2 placeholder:text-gray-400 focus:ring-1 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                </div>
              </div>
              <div class="sm:col-span-3">
                <label
                  for="country"
                  class="block text-sm font-medium leading-6 text-gray-900"
                  >Role</label
                >
                <div class="mt-2">
                  <select
                    v-model="item.role"
                    id="country"
                    name="country"
                    autocomplete="country-name"
                    class="block w-full rounded-md border-0 py-3 px-2 text-gray-900 shadow-sm ring-inset ring-gray-300 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6"
                  >
                    <option>Driver</option>
                    <option>PA</option>
                    <option>office staff</option>
                  </select>
                </div>
              </div>

              <div class="">
                <label
                  for="passport_exp"
                  class="block text-sm w-full font-medium px-1 text-primary-text"
                  >Passport Expiry Date</label
                >
                <input
                  v-model="item.passport_exp"
                  type="date"
                  id="passport_exp"
                  name="passport_exp"
                  class="p-2 border text-gray-500 rounded-md w-[300px] focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
              <div class="">
                <label
                  for="bio_exp"
                  class="block text-sm w-full font-medium px-1 text-primary-text"
                  >BiO Expiry Date</label
                >
                <input
                  v-model="item.bio_exp"
                  type="date"
                  id="bio_exp"
                  name="bio_exp"
                  class="p-2 border text-gray-500 rounded-md w-[300px] focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
              <div class="">
                <label
                  for="DVLA_badge_exp"
                  class="block text-sm w-full font-medium px-1 text-primary-text"
                >
                  Licence (DVLA) Expiry Date</label
                >
                <input
                  v-model="item.DVLA_exp"
                  type="date"
                  id="DVLA_badge_exp"
                  name="DVLA_badge_exp"
                  class="p-2 border text-gray-500 rounded-md w-[300px] focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
              <div class="">
                <label
                  for="taxi_badge_exp"
                  class="block text-sm w-full font-medium px-1 text-primary-text"
                  >Taxi Badge Expiry Date</label
                >
                <input
                  v-model="item.taxi_badge_exp"
                  type="date"
                  id="taxi_badge_exp"
                  name="taxi_badge_exp"
                  class="p-2 border text-gray-500 rounded-md w-[300px] focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
              <div class="">
                <label
                  for="ABI_exp"
                  class="block text-sm w-full font-medium px-1 text-primary-text"
                  >AIB Expiry Date</label
                >
                <input
                  v-model="item.AIB_exp"
                  type="date"
                  id="ABI_exp"
                  name="ABI_exp"
                  class="p-2 border text-gray-500 rounded-md w-[300px] focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
              <div class="">
                <label
                  for="first_aid_exp"
                  class="block text-sm w-full font-medium px-1 text-primary-text"
                  >First Aid Expiry Date</label
                >
                <input
                  v-model="item.first_aid_exp"
                  type="date"
                  id="first_aid_exp"
                  name="first_aid_exp"
                  class="p-2 border text-gray-500 rounded-md w-[300px] focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
              <div class="">
                <label
                  for="safeguarding_exp"
                  class="block text-sm w-full font-medium px-1 text-primary-text"
                  >Safeguarding Training Expiry Date</label
                >
                <input
                  v-model="item.safeguarding_exp"
                  type="date"
                  id="safeguarding_exp"
                  name="safeguarding_exp"
                  class="p-2 border text-gray-500 rounded-md w-[300px] focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
              <div class="">
                <label
                  for="disability_exp"
                  class="block text-sm w-full font-medium px-1 text-primary-text"
                  >Disability Training Expiry Date</label
                >
                <input
                  v-model="item.disability_exp"
                  type="date"
                  id="disability_exp"
                  name="disability_exp"
                  class="p-2 border text-gray-500 rounded-md w-[300px] focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
              <div class="">
                <label
                  for="epilepsy_exp"
                  class="block text-sm w-full font-medium px-1 text-primary-text"
                  >Epilepsy Training Expiry Date</label
                >
                <input
                  v-model="item.epilepsy_exp"
                  type="date"
                  id="epilepsy_exp"
                  name="epilepsy_exp"
                  class="p-2 border text-gray-500 rounded-md w-[300px] focus:outline-none focus:ring focus:border-blue-300"
                />
              </div>
            </div>
            <div class="w-full flex justify-center">
              <button
                type="button"
                @click="update"
                class="text-white bg-primary px-3 py-2 rounded"
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
