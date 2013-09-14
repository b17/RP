# coding: utf-8
require 'test_helper'

class StringHelperTest < ActionView::TestCase
  test 'should transliterate russian text into english' do
    assert_equal 'Kak dela', StringHelper.translit('Как дела', :english)
  end

  test 'should generate correct rewrite (url)' do
    assert_equal 'kak-dela', StringHelper.urlize('Как дела')
    assert_equal 'not-transliterated', StringHelper.urlize('Not transliterated')
  end

end
