package com.openappengine.model.batch



import org.junit.*
import grails.test.mixin.*

@TestFor(BulkPaymentUploadController)
@Mock(BulkPaymentUpload)
class BulkPaymentUploadControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/bulkPaymentUpload/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.bulkPaymentUploadInstanceList.size() == 0
        assert model.bulkPaymentUploadInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.bulkPaymentUploadInstance != null
    }

    void testSave() {
        controller.save()

        assert model.bulkPaymentUploadInstance != null
        assert view == '/bulkPaymentUpload/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/bulkPaymentUpload/show/1'
        assert controller.flash.message != null
        assert BulkPaymentUpload.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/bulkPaymentUpload/list'


        populateValidParams(params)
        def bulkPaymentUpload = new BulkPaymentUpload(params)

        assert bulkPaymentUpload.save() != null

        params.id = bulkPaymentUpload.id

        def model = controller.show()

        assert model.bulkPaymentUploadInstance == bulkPaymentUpload
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/bulkPaymentUpload/list'


        populateValidParams(params)
        def bulkPaymentUpload = new BulkPaymentUpload(params)

        assert bulkPaymentUpload.save() != null

        params.id = bulkPaymentUpload.id

        def model = controller.edit()

        assert model.bulkPaymentUploadInstance == bulkPaymentUpload
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/bulkPaymentUpload/list'

        response.reset()


        populateValidParams(params)
        def bulkPaymentUpload = new BulkPaymentUpload(params)

        assert bulkPaymentUpload.save() != null

        // test invalid parameters in update
        params.id = bulkPaymentUpload.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/bulkPaymentUpload/edit"
        assert model.bulkPaymentUploadInstance != null

        bulkPaymentUpload.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/bulkPaymentUpload/show/$bulkPaymentUpload.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        bulkPaymentUpload.clearErrors()

        populateValidParams(params)
        params.id = bulkPaymentUpload.id
        params.version = -1
        controller.update()

        assert view == "/bulkPaymentUpload/edit"
        assert model.bulkPaymentUploadInstance != null
        assert model.bulkPaymentUploadInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/bulkPaymentUpload/list'

        response.reset()

        populateValidParams(params)
        def bulkPaymentUpload = new BulkPaymentUpload(params)

        assert bulkPaymentUpload.save() != null
        assert BulkPaymentUpload.count() == 1

        params.id = bulkPaymentUpload.id

        controller.delete()

        assert BulkPaymentUpload.count() == 0
        assert BulkPaymentUpload.get(bulkPaymentUpload.id) == null
        assert response.redirectedUrl == '/bulkPaymentUpload/list'
    }
}
