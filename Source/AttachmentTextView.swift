//
//  AttachmentTextView.swift
//  AttachmentTextView
//
//  Created by LC on 2024/1/16.
//

import UIKit

open class AttachmentTextView: UITextView {

    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.commonInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private let attachmentBehavior = AttachmentTextViewBehavior()

    private func commonInit() {
        self.attachmentBehavior.textView = self
        self.layoutManager.delegate = self.attachmentBehavior
        self.textStorage.delegate = self.attachmentBehavior
    }

    open override var textContainerInset: UIEdgeInsets {
        didSet {
            self.attachmentBehavior.layoutAttachedSubviews()
        }
    }

}
