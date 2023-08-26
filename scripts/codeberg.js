/**
 * Get a user's repositories from codeberg.org
 * @returns {Object}
 */
async function GetRepos() {
    try {
        const response = await fetch(`https://codeberg.org/api/v1/users/amycatgirl/repos`, {
            headers: {
                "Accept": "application/json",
            }
        });

        /**
         * @type {object}
         */
        const json = await response.json();

        return {
            failed: false,
            data: json,
        };

    } catch(error) {
        console.error("[getrepos] Error whilst fetching repos:", error);

        return {
            failed: true,
            error: error.message
        }
    }
}