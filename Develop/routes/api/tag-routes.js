const router = require('express').Router();
const {Tag, Product, ProductTag} = require('../../models');

// The `/api/tags` endpoint

// Get all tags and include associated Product data
router.get('/', async (req, res) => {
    try {
        const tags = await Tag.findAll({
            include: [{model: Product, through: ProductTag}]
        });
        res.status(200).json(tags);
    } catch (err) {
        res.status(500).json(err);
    }
});

// Get a single tag by its `id` and include associated Product data
router.get('/:id', async (req, res) => {
    try {
        const tag = await Tag.findByPk(req.params.id, {
            include: [{model: Product, through: ProductTag}]
        });

        if (!tag) {
            res.status(404).json({message: 'No tag found with this id!'});
            return;
        }
        res.status(200).json(tag);
    } catch (err) {
        res.status(500).json(err);
    }
});

// Create a new tag
router.post('/', async (req, res) => {
    try {
        const newTag = await Tag.create(req.body);
        res.status(200).json(newTag);
    } catch (err) {
        res.status(400).json(err);
    }
});

// Update a tag's name by its `id` value
router.put('/:id', async (req, res) => {
    try {
        const updatedTag = await Tag.update(req.body, {
            where: {
                id: req.params.id
            }
        });

        if (!updatedTag) {
            res.status(404).json({message: 'No tag found with this id!'});
            return;
        }

        res.status(200).json(updatedTag);
    } catch (err) {
        res.status(500).json(err);
    }
});

// Delete a tag by its `id` value
router.delete('/:id', async (req, res) => {
    try {
        const deletedTag = await Tag.destroy({
            where: {
                id: req.params.id
            }
        });

        if (!deletedTag) {
            res.status(404).json({message: 'No tag found with this id!'});
            return;
        }

        res.status(200).json(deletedTag);
    } catch (err) {
        res.status(500).json(err);
    }
});

module.exports = router;


// const router = require('express').Router();
// const { Tag, Product, ProductTag } = require('../../models');
//
// // The `/api/tags` endpoint
//
// router.get('/', (req, res) => {
//     // find all tags
//     // be sure to include its associated Product data
// });
//
// router.get('/:id', (req, res) => {
//     // find a single tag by its `id`
//     // be sure to include its associated Product data
// });
//
// router.post('/', (req, res) => {
//     // create a new tag
// });
//
// router.put('/:id', (req, res) => {
//     // update a tag's name by its `id` value
// });
//
// router.delete('/:id', (req, res) => {
//     // delete on tag by its `id` value
// });
//
// module.exports = router;