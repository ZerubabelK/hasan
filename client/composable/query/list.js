
import  {useQuery} from "@vue/apollo-composable"

// Default Values
const defaultClientId = ref("user");
const defaultOffset = ref(0);
const defaultLimit = ref(60); // 60 is divisible by 2,3,4 and 5. hence making it compatible with most lists and tables.
const defaultFilter = ref({});

export default function (
    query,
    {
        filter = defaultFilter,
        limit = defaultLimit,
        offset = defaultOffset,
        clientId = defaultClientId,
    },
) {
    console.log(filter?.value);
    const { onResult, loading, onError, refetch } = useQuery(
        query,
        () => ({
            limit: limit.value,
            offset: offset.value,
            filter: filter?.value,
        }),
        () => ({
            fetchPolicy: "network-only",
            context: {
                headers: {
                  "x-hasura-admin-secret":"YJH4s7x9412ZUUDSFd5MiBOsuySqYnokDj5fPhV04qcpTm8YeGjV2Wbp7wg4yUEQ"

                },
              },
            // debounce: "2000",
        }),
    );

    return {
        onResult,
        loading,
        refetch,
        onError
    };
}
