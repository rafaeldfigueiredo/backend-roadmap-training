import mongodb from 'mongodb'
const ObjectId = mongodb.ObjectId

let reviews

// biome-ignore lint/complexity/noStaticOnlyClass: <explanation>
export default class ReviewsDAO {
    static async injectDB(conn) {
        if (reviews) { return }
        try {
            reviews = await conn.db("reviews").collection("reviews")
        } catch (e) {
            console.error(`Unable to connect. ${e}`);

        }
    }
    static async addReview(movieId, user, review) {
        try {
            const reviewDoc = {
                movieId: movieId,
                user: user,
                review: review
            }
            return await reviews.insertOne(reviewDoc)
        } catch (e) {
            console.error("Unable to post reviews");
            return { error: e }

        }
    }
    static async getReview(reviewId) {
        try {
            return await reviews.findOne({ _id: ObjectId(reviewId) })
        } catch (e) {
            console.error("Unable to get reviews");
            return { error: e }
        }
    }
    static async updateReview(reviewId, user, review) {
        try {
            const updateResponse = await reviews.updateOne(
                { _id: ObjectId(reviewId) },
                { $set: { user: user, review: review } }
            )
            return updateResponse
        } catch (e) {
            console.error("Unable to update reviews");
            return { error: e }

        }
    }

    static async deleteReview(reviewId) {
        try {
            const deleteResponse = await reviews.deleteOne({
                _id: ObjectId(reviewId),
            })
            return deleteResponse
        } catch (e) {
            console.error("Unable to delete reviews");
            return { error: e }

        }
    }

    static async getReviews(movieId) {
        try {
            // biome-ignore lint/style/useNumberNamespace: <explanation>
            const cursor = await reviews.find({ movieId: parseInt(movieId) })
            return cursor.toArray()
        } catch (e) {
            console.error("Unable to get reviews");
            return { error: e }
        }
    }
}