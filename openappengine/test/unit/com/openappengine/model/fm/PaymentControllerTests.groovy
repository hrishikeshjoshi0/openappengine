package com.openappengine.model.fm



import org.junit.*
import grails.test.mixin.*

@TestFor(PaymentController)
@Mock(FmPayment)
class PaymentControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/fmPayment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fmPaymentInstanceList.size() == 0
        assert model.fmPaymentInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.fmPaymentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fmPaymentInstance != null
        assert view == '/fmPayment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/fmPayment/show/1'
        assert controller.flash.message != null
        assert FmPayment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/fmPayment/list'


        populateValidParams(params)
        def fmPayment = new FmPayment(params)

        assert fmPayment.save() != null

        params.id = fmPayment.id

        def model = controller.show()

        assert model.fmPaymentInstance == fmPayment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/fmPayment/list'


        populateValidParams(params)
        def fmPayment = new FmPayment(params)

        assert fmPayment.save() != null

        params.id = fmPayment.id

        def model = controller.edit()

        assert model.fmPaymentInstance == fmPayment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/fmPayment/list'

        response.reset()


        populateValidParams(params)
        def fmPayment = new FmPayment(params)

        assert fmPayment.save() != null

        // test invalid parameters in update
        params.id = fmPayment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/fmPayment/edit"
        assert model.fmPaymentInstance != null

        fmPayment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/fmPayment/show/$fmPayment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        fmPayment.clearErrors()

        populateValidParams(params)
        params.id = fmPayment.id
        params.version = -1
        controller.update()

        assert view == "/fmPayment/edit"
        assert model.fmPaymentInstance != null
        assert model.fmPaymentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/fmPayment/list'

        response.reset()

        populateValidParams(params)
        def fmPayment = new FmPayment(params)

        assert fmPayment.save() != null
        assert FmPayment.count() == 1

        params.id = fmPayment.id

        controller.delete()

        assert FmPayment.count() == 0
        assert FmPayment.get(fmPayment.id) == null
        assert response.redirectedUrl == '/fmPayment/list'
    }
}
