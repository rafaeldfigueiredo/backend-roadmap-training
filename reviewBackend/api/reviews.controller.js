import ReviewsDAO from '../dao/reviewsDAO.js'

// biome-ignore lint/complexity/noStaticOnlyClass: <explanation>
export default class ReviewsController {
    static async apiPostReview(req, res, nex) {
        try {
            const movieId = req.body.movieId
            const review = req.body.review
            const user = req.body.user

            const reviewResponse = await ReviewsDAO.addReview(movieId, review, user)
            res.json({ status: "Success!" })
        } catch (e) {
            res.status(500).json({ error: e.message })
        }
    }
    static async apiGetReview(req, res, next) {
        try {
            // biome-ignore lint/style/useConst: <explanation>
            let id = req.params.id || {}
            // biome-ignore lint/style/useConst: <explanation>
            let review = await ReviewsDAO.getReview(id)
            if (!review) {
                res.status(404).json({ error: "Not Found!" })
                return
            }
            res.json(review)
        } catch (e) {
            console.log(e);
            res.status(500).json({ error: e })
        }
    }
    static async apiUpdateReview(req, res, nex) {
        try {
            const movieId = req.body.movieId
            const review = req.body.review
            const user = req.body.user

            const reviewResponse = await ReviewsDAO.updateReview(movieId, review, user)

            // biome-ignore lint/correctness/noInnerDeclarations: <explanation>
            // biome-ignore lint/style/noVar: <explanation>
            var { error } = reviewResponse
            if (error) {
                res.status(400).json({ error })
            }
            if (reviewResponse.modifiedCount === 0) {
                throw new Error("Unable to update review")
            }

            res.json({ status: "Success!" })
        } catch (e) {
            res.status(500).json({ error: e.message })
        }
    }

    static async apiDeleteReview(req, res, next) {
        try {
            const reviewId = req.params.id
            const reviewResponse = await ReviewsDAO.deleteReview(reviewId)
            res.json({ status: "Success!" })
        } catch (e) {
            res.status(500).json({ error: e.message })
        }
    }

    static async apiGetReviews(req, res, next) {
        try {
            // biome-ignore lint/style/useConst: <explanation>
            let id = req.params.id || {}
            // biome-ignore lint/style/useConst: <explanation>
            let reviews = await ReviewsDAO.getReviewsByMovieId(id)
            if (!reviews) {
                res.status(404).json({ error: "Not Found" })
            }
            res.json({ status: "Success!" })
        } catch (e) {
            console.log(e);

            res.status(500).json({ error: e.message })
        }
    }
}